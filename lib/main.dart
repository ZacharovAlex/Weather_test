import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_simple/repository/repostory_dadata.dart';
import 'package:weather_simple/utils/dateFormatter.dart';
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

import 'open_weather_models/forecast_model/foercastListDate.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';

void main() {
 // initializeDateFormatting('ru','');
 // Intl.defaultLocale = 'ru_RU';
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
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700,color: Color(0xFF276587)),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          caption: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
      ),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.icons.backScreen.image().image,
            fit: BoxFit.cover,
          ),
        ),
        // decoration: const BoxDecoration(gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   colors: [Color(0xFF08244F),Color(0xFF0B42AB)],
        // )),
        child:  Scaffold(

        backgroundColor: Colors.transparent,

        body: BlocProvider(
          create: (_) => getIt.get<MainCubit>(),
          child: RowWidget(),
        ) ,),)
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

   return
      Padding(padding: const EdgeInsets.only(top: 20),child:

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          TopCity(),

         if(data!=null && dataForecast!=null ) NowWeatherView(data: data,trigger: nowOrForecast, dataForecast: dataForecast, dayIndex: dayIndex,) else
              Text('прогноз отображение'),
//SizedBox(height: 100,),
          if (dataForecast!=null)  Container(
            height: MediaQuery.of(context).size.height/8,
            child: Expanded(
                child: TimeScrollForecast(data: dataForecast.forecast4Days, dayToShowIndex: dayIndex,)),
          ),

//         Container(
//          // margin: EdgeInsets.only(bottom: 300),
//           padding: EdgeInsets.symmetric(horizontal: 35,vertical: 12,),
//          // margin: EdgeInsets.all(50),
//           decoration: BoxDecoration(
//             color: Color(0xFF001026).withOpacity(0.3),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [BoxShadow(color: Color(0x00000040))]
//           ),
//           child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Assets.icons.kapli.svg(),
// //if(data!=null) Text(data!..toString()) else CircularProgressIndicator(),
//               Assets.icons.termometr.svg(),
//              if(data!=null) Text('${((data.main!.temp!).toInt()).toString()}') else CircularProgressIndicator(),
//               Assets.icons.wind.svg(),
//               if(data!=null) Text("${data.wind!.speed.toString()}m/s") else CircularProgressIndicator(),
//           ],),
//
//         ),
        //  TextButton(onPressed: (){PlaceApiProvider().fetchSuggestions('Мос', 'ru');}, child: Text('ok')),
        //  TextButton(onPressed: (){}, child: Text('ok'))
            SizedBox(height: 20,),
        if (dataForecast!=null)  Expanded(
            child: ForecastListRow(data: dataForecast,dataNow: data,)) else CircularProgressIndicator(),
        ],)


     );
  }
}


class TopCity extends StatelessWidget {
  const TopCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((MainCubit cubit) => cubit.state.weatherResponse);
    return Padding(
      padding: EdgeInsets.only(left: 30,right: 30)

      ,child: Row(


      children: [
        Assets.icons.mapIcon.svg(),
       SizedBox(width: 10,),
        if (data!=null) Text(data.name!,style: Theme.of(context).textTheme.bodyText2,)  else CircularProgressIndicator(),
        Spacer(),
        Assets.icons.ring.svg()




      ],),);
  }
}




class NowWeatherView extends StatelessWidget {
 final getWetherFromCoordinates data;
 final ForecastResponse dataForecast;
 final NowOrForecast trigger;
 final int dayIndex;
  const NowWeatherView({Key? key, required this.data, required this.dataForecast, required this.trigger, required this.dayIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var tempNow = '';
var descriptionNow ='';

if (trigger==NowOrForecast.now) {
  tempNow= (data.main!.temp)!.round().toString();
  descriptionNow= data.weather[0]!.description!;
} else if(dayIndex==0) {
  tempNow=dataForecast.forecast4Days![dayIndex].first.main!.temp!.round().toString();
 descriptionNow= data.weather[0]!.description!;
} else {
  tempNow = '${dataForecast.temperatureNight(dataForecast.forecast4Days![dayIndex]).toString()}/${dataForecast
      .temperatureDay(dataForecast.forecast4Days![dayIndex]).toString()}';
  descriptionNow= dataForecast.forecast4Days![dayIndex][4].weather![0].description!;
}
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        width: 190,
        height: 190,
        decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white.withOpacity(0.59), Color(0xF7F7F734).withOpacity(0.3),]
            ),
             color: Color(0xFF001026).withOpacity(0.3),
          shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 60,
              ),
            ]
          //  border: Border.all(color: ColorName.primary, width: 7 * scaleDownAnimation.value),
        ),
        child:   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  Text('${dateFormatter(DateTime.now(),trigger)}'),

            Text('$tempNow',style: Theme.of(context).textTheme.headline1,),
            Text('$descriptionNow',style: Theme.of(context).textTheme.caption,),
            
          //  Text(' ${data.weather[0]!.description.toString()}')
          ],
      ),
        ),
      
      ),
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
                    // gradient: LinearGradient(
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //     colors: [Colors.blue, Color(0xFF001026).withOpacity(0.3),]
                    // ),
                  //  color: Color(0xFF001026).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  // boxShadow: [BoxShadow(color: Color(0xFF42A0F01A).withOpacity(0.1))]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
if (index==4) Text('12.00',style: Theme.of(context).textTheme.caption) else
                   Text("${dateParser(data![dayToShowIndex][index].dtTxt!).hour}.00",style: Theme.of(context).textTheme.caption),
                    Assets.icons.sun2.image(height: 25),

                      Text('${(data![dayToShowIndex][index].main!.temp)!.round()}',style: Theme.of(context).textTheme.bodyText2),

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

class Forecast3hViewCarusel extends StatelessWidget {
  final ForecastResponse? data;
  const Forecast3hViewCarusel({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ForecastListRow extends StatelessWidget {
  final ForecastResponse? data;
  final getWetherFromCoordinates? dataNow;
  const ForecastListRow({Key? key, this.data, this.dataNow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void clickDayForecast(int index){
      context.read<MainCubit>().changeDayForecasting(index);
      context.read<MainCubit>().changeNowOrForecast(NowOrForecast.forecast);
    }
    return ListView.builder(
       // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data!.forecast4Days!.length,
        itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () => clickDayForecast(index),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            // margin: EdgeInsets.only(bottom: 300),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12,),
            // margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Color(0xFF001026).withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Color(0x00000040))]
            ),
            child: Row(

             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${weekdayParser(dateParser(data!.forecast4Days![index][0].dtTxt!))}',style: Theme.of(context).textTheme.bodyText1),
                SizedBox(width: 10,),
                Container(
                  width: 100,
                  child: index==0? Text(" ${dataNow!.weather[0]!.description}",style: Theme.of(context).textTheme.caption,):
                Text(" ${data!.forecast4Days![index][4].weather![0].description}",style: Theme.of(context).textTheme.caption),),
               index!=0? Text(' День ${data!.temperatureDay(data!.forecast4Days![index])}',style: Theme.of(context).textTheme.caption): SizedBox(),
                index!=0? Text(' Ночь ${data!.temperatureNight(data!.forecast4Days![index])}',style: Theme.of(context).textTheme.caption): SizedBox(),

              ],),

          ),
        ),
      );}
    );
  }
}







