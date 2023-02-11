import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather_simple/repository/repository_weather.dart';
import 'package:weather_simple/repository/repostory_dadata.dart';
import 'package:weather_simple/utils/dateFormatter.dart';
import 'package:weather_simple/utils/pressure.dart';
import 'package:weather_simple/weatherEnumIcon.dart';
import 'addrressSearch.dart';
import 'animation/anim_weather.dart';
import 'dadata/autocompleteApi.dart';
import 'di/injectable.dart';
import 'enum_now_or_forecast.dart';
import 'getWeatherResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_cubit.dart';
import 'gen/assets/assets.gen.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'modalWindow.dart';
import 'open_weather_models/forecast_model/foercastListDate.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';
final logger = Logger(printer: SimplePrinter());

void main() {

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     fontFamily: 'SF Pro Display',
       // brightness: Brightness.light,
      //  primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          caption: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
      ),
      home: Scaffold(

      backgroundColor: Colors.white,

      body: BlocProvider(
        create: (_) => getIt.get<MainCubit>(),
        child: SafeArea(child: RowWidget()),
      ) ,),
    );
  }
}



class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((MainCubit cubit) => cubit.state.weatherResponse);
    final dataForecast = context.select((MainCubit cubit) => cubit.state.forecastResponse);
    final dayIndex = context.select((MainCubit cubit) => cubit.state.dayForecasting);
    final nowOrForecast = context.select((MainCubit cubit) => cubit.state.nowOrForecast);
    final arrayOfForecastDays = context.select((MainCubit cubit) => cubit.state.arrayForecastByDays);

   return
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20,),
           // ModalBottomSheetDemo(),
          TopCity(),

         if(data!=null && dataForecast!=null ) NowWeatherView(data: data,trigger: nowOrForecast, dataForecast: dataForecast, dayIndex: dayIndex, arrayForecastingDays: arrayOfForecastDays ,) else
              Text('прогноз отображение'),
//SizedBox(height: 100,),


            SizedBox(height: 10,),
          if (dataForecast!=null)
          //  height: MediaQuery.of(context).size.height/7,
             Expanded(
              flex: 4,
                child: TimeScrollForecast(data: arrayOfForecastDays, dayToShowIndex: dayIndex,)),


            SizedBox(height: 10,),
        if (dataForecast!=null && data!=null)  Expanded(
            flex: 7,
            child: ForecastListRow(data: dataForecast,dataNow: data, arrayForecastingDays: arrayOfForecastDays )) else CircularProgressIndicator(),
           // SizedBox(height: 10,),

        ],);



  }
}


class TopCity extends StatelessWidget {
  const TopCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showDialogCity(){
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (_) {
          return
            BlocProvider.value(
                value: BlocProvider.of<MainCubit>(context),
                child:  ButtonsCity()
            );




          ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Королёв');}, child: Text('Королев'));
        },
      );

    }


    final data = context.select((MainCubit cubit) => cubit.state.weatherResponse);
    return Padding(
      padding: EdgeInsets.only(left: 40)

      ,child: Row(
      mainAxisAlignment: MainAxisAlignment.start,


      children: [

       // ModalBottomSheetDemo(),
       // Assets.icons.mapIcon.svg(),
      // SizedBox(width: 10,),
        if (data!=null)


          GestureDetector(
              onTap: showDialogCity,
              child: Text(data.name!,style: Theme.of(context).textTheme.bodyText2,))  else CircularProgressIndicator(),
       // Spacer(),
      //  Assets.icons.ring.svg()




      ],),);
  }
}




class NowWeatherView extends StatelessWidget {
 final getWetherFromCoordinates data;
 final ForecastResponse dataForecast;
 final NowOrForecast trigger;
 final List<List<ForecastDateList>>? arrayForecastingDays;
 final int dayIndex;

  const NowWeatherView({Key? key, required this.data, required this.dataForecast, required this.trigger, required this.dayIndex, this.arrayForecastingDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late SvgPicture iconNowWeather;
    late Widget pressure;
var tempNow = '';
var descriptionNow ='';
DateTime nowOrForecastDate;

var  riseUp = (DateTime.fromMillisecondsSinceEpoch(data.sys!.sunrise!*1000, isUtc: false));
var sunset= (DateTime.fromMillisecondsSinceEpoch(data.sys!.sunset!*1000, isUtc: false));
if (trigger==NowOrForecast.now) {

  iconNowWeather = IconName(data.weather[0]!.id!,50);
  nowOrForecastDate=DateTime.now();
  tempNow= (data.main!.temp)!.round().toString();
  descriptionNow= data.weather[0]!.description!;
  pressure = pressureMmRtutniyStolb(data.main!.pressure!,20);

} else if(dayIndex==0) {
  pressure=pressureMmRtutniyStolb(arrayForecastingDays![dayIndex].first.main!.pressure!,20);
  iconNowWeather = IconName(arrayForecastingDays![dayIndex].first.weather![0].id!,50);
  nowOrForecastDate=DateTime.now();
  tempNow=arrayForecastingDays![dayIndex].first.main!.temp!.round().toString();
 descriptionNow= data.weather[0]!.description!;

} else {
  pressure=pressureMmRtutniyStolb(dataForecast.mediumPressure(arrayForecastingDays![dayIndex]),20);
  iconNowWeather = IconName(arrayForecastingDays![dayIndex][4].weather![0].id!,50);
  nowOrForecastDate=dateParser(arrayForecastingDays![dayIndex].first.dtTxt!);
  tempNow = '${dataForecast.temperatureNight(arrayForecastingDays![dayIndex]).toString()}/${dataForecast
      .temperatureDay(arrayForecastingDays![dayIndex]).toString()}';
  descriptionNow= arrayForecastingDays![dayIndex][4].weather![0].description!;
}
    return Stack(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),
                   // shape: BoxShape.circle,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Рассвет',style: Theme.of(context).textTheme.caption,),
                      Text('${riseUp.hour}.${riseUp.minute}'),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width/2.2,
                height: MediaQuery.of(context).size.width/2.2,
                decoration: BoxDecoration(

                  border: Border.all(
                    width: 2,
                  ),
                     color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
               // duration: Duration(seconds: 5),
                child:   Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.8 ,
                        child: Column(

                        children: [
                        Text('${dateFormatterWeekday(nowOrForecastDate,trigger)}',style: Theme.of(context).textTheme.caption),
                        Text('${dateFormatterDayMonth(nowOrForecastDate)}',style: Theme.of(context).textTheme.caption),
                      ],),),


                     // Text('${dateFormatterWeekday(nowOrForecastDate,trigger)}',style: Theme.of(context).textTheme.caption),
                     //  Text('${dateFormatterDayMonth(nowOrForecastDate)}',style: Theme.of(context).textTheme.caption),
                      Text('$tempNow'+"\u2103",style: Theme.of(context).textTheme.headline1,),
                      SizedBox(

                          width: MediaQuery.of(context).size.width/2.8 ,
                          child: Text('$descriptionNow',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.center,)),

                      pressure,
                    ],
              ),
                  ),
                ),

              ),
              Container(
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),

                  ),
                  child: Column(
                    children: [
                      Text('Закат',style: Theme.of(context).textTheme.caption,),
                      Text('${sunset.hour}.${sunset.minute}'),
                    ],
                  )),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width/2.0+50,
            child: Container(child: iconNowWeather ,)),
      ],
    );

    //   Column(children: [
    //   trigger==NowOrForecast.now? Column(
    //     children: [
    //       Text('${dateFormatter(DateTime.now(),trigger)}'),
    //
    //       Text(' температура ${data.main!.temp.toString()}'),
    //       Text(' ${data.weather[0]!.description.toString()}')
    //     ],
    //   ):
    //   Column(
    //     children: [
    //       Text('${dateFormatter(dateParser(dataForecast.forecast4Days![dayIndex].first.dtTxt!),trigger)}'),
    //
    //       Text(' температура ${dataForecast.forecast4Days![dayIndex].first.main!.temp}'),
    //       Text(' ${dataForecast.forecast4Days![dayIndex].first.weather![0].description}')
    //     ],
    //   )
    //
    //
    // ],);
  }
}


class TimeScrollForecast extends StatelessWidget {
  final List<List<ForecastDateList>>? data;
  final int dayToShowIndex;
  const TimeScrollForecast({Key? key, this.data, required this.dayToShowIndex, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print('${dateParser(data![2][4].dtTxt!).hour}');
   // DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
   // var a = data!.where((element) => format.parse(element.dtTxt!).day==DateTime.now().day).toList();
  //  var fdfd = data!.firstIndexNextDay;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemCount:  data![dayToShowIndex].length,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: EdgeInsets.only(left: 15),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10,),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
               border: Border.all(
                          width: 2,
                        ),
                    borderRadius: BorderRadius.circular(20),
                 //  boxShadow: [BoxShadow(color: Color(0xFF42A0F01A).withOpacity(0.1))]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
if (index==4) Text('12.00',style: Theme.of(context).textTheme.caption) else
                   Text("${dateParser(data![dayToShowIndex][index].dtTxt!).hour}.00",style: Theme.of(context).textTheme.caption),
                  //  Assets.icons.sunny.svg(height: 50),
                  //  Assets.icons.snow.svg(height: 50),
                    IconName(data![dayToShowIndex][index].weather![0].id!,50.0),

                      Text('${(data![dayToShowIndex][index].main!.temp)!.round()}'+"\u2103",style: Theme.of(context).textTheme.bodyText2),
                    pressureMmRtutniyStolb(data![dayToShowIndex][index].main!.pressure!,15),
                    // Row(children: [
                    //   Assets.icons.kapli.svg(),
                    //   Text('${(data![dayToShowIndex][index])!}'),
                    // ],)

                  ],
                )),
          );
        });
  }
}

class ForecastListRow extends StatelessWidget {
  final ForecastResponse? data;
  final getWetherFromCoordinates? dataNow;
  final List<List<ForecastDateList>>? arrayForecastingDays;
  //final  bool selecged ;
  const ForecastListRow({Key? key, this.data, this.dataNow, this.arrayForecastingDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScrollController scrollController = ScrollController();

    void clickDayForecast(int index){
      context.read<MainCubit>().changeDayForecasting(index);
      context.read<MainCubit>().changeNowOrForecast(NowOrForecast.forecast);
    }
    return ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: arrayForecastingDays!.length,
        itemBuilder: (BuildContext context, int index) {
          late int dayIndexTodayOrForecast;
          late int temperatureNight;
          late int temperatureDay;
          late Widget pressure;
          if(index==0){
            pressure=pressureMmRtutniyStolb(arrayForecastingDays![0][0].main!.pressure!,20);
          temperatureNight = (arrayForecastingDays![0][0].main!.temp!).round();
            temperatureDay = (arrayForecastingDays![0][0].main!.temp!).round();
            dayIndexTodayOrForecast = 0;
          } else {
            pressure=pressureMmRtutniyStolb(data!.mediumPressure(arrayForecastingDays![index]),20);//pressure=pressureMmRtutniyStolb(dataForecast.mediumPressure(arrayForecastingDays![dayIndex]),20);
            temperatureNight =data!.temperatureNight(arrayForecastingDays![index]);
            temperatureDay = data!.temperatureDay(arrayForecastingDays![index]);
            dayIndexTodayOrForecast = 4;}
      return GestureDetector(
        onTap: () {
          scrollController.animateTo(index*130, duration: Duration(seconds: 2), curve: Curves.easeInOut );
         // scrollController.position.
              clickDayForecast(index);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
            decoration: BoxDecoration(
              color:  Colors.white.withOpacity(0.5) ,
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),

            ),
            child: Column(

             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${dateFormatterDayMonth(dateParser(arrayForecastingDays![index][0].dtTxt!))}',style: Theme.of(context).textTheme.caption),
                Text('${weekdayParser(dateParser(arrayForecastingDays![index][0].dtTxt!))}',style: Theme.of(context).textTheme.bodyText1),
                IconName(arrayForecastingDays![index][dayIndexTodayOrForecast].weather![0].id!,70.0), //IconName(arrayForecastingDays![index][0].weather![0].id!,100.0),
                Container(child:
                 index!=0? Column(children: [
                    Row(children: [
                      Text('Ночь : '),
                      Text('${temperatureNight}'+"\u2103")

                    ],),
                    Row(children: [
                      Text('День : '),
                      Text('${temperatureDay}'+"\u2103")
                    ],),
                  ],): Text('${temperatureDay}'+"\u2103")

                  ,),


                SizedBox(width: 5,),
                Row(
                  children: [
                    Text('Давление : '),
                    pressure,
                  ],
                ),
                Row(
                  children: [
                    Text('Сила ветра : '),
                    Text('${data!.mediumWind(arrayForecastingDays![index])}м/с')
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //   Column(children: [
                //     Assets.icons.wind.svg(),
                //     Text('${data!.mediumWind(arrayForecastingDays![index])}м/с',style: Theme.of(context).textTheme.caption)
                //   ],),
                //   SizedBox(width: 20,),
                //   Column(children: [
                //     Assets.icons.wind.svg(),
                //     Text('${data!.mediumWind(arrayForecastingDays![index])}',style: Theme.of(context).textTheme.caption)
                //   ],),
                //     SizedBox(width: 20,),
                //   Column(children: [
                //     Assets.icons.wind.svg(),
                //     Text('${data!.mediumWind(arrayForecastingDays![index])}',style: Theme.of(context).textTheme.caption)
                //   ],),
                // ],),
                SizedBox(width: 10,),
                // Container(
                //   width: 100,
                //   child: index==0? Text(" ${dataNow!.weather[0]!.description}",style: Theme.of(context).textTheme.caption,):
                // Text(" ${data!.forecast4Days![index][4].weather![0].description}",style: Theme.of(context).textTheme.caption),),
              // index!=0? Text('${data!.temperatureNight(arrayForecastingDays![index])}/${data!.temperatureDay(arrayForecastingDays![index])}',style: Theme.of(context).textTheme.bodyText2): SizedBox(),
            //  Text('${dataNow!.main!.temp!.round().toString()}/${dataNow!.main!.tempMin!.round().toString()}',style: Theme.of(context).textTheme.bodyText2)

              ],),

          ),
        ),
      );}
    );
  }
}







