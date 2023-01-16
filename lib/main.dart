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
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 64.0, fontWeight: FontWeight.w600,color: Colors.white),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
      home: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          colors: [Color(0xFF08244F),Color(0xFF0B42AB)],
        )),
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
   // final tempcelc = (data!.main!.temp!-270).toInt();
   //  if (dataForecast!=null) return
   //    Column(children: [
   //
   //      Text('gfgfgf'),
   //  ListForecast(data: dataForecast)
   //    ],); else return   CircularProgressIndicator();

   return
      Padding(padding: const EdgeInsets.only(top: 40),child:

        Column(children: [
          TopCity(),

          NowWeatherView(),
          if (dataForecast!=null)Expanded(child: TimeScrollForecast(data: dataForecast!.forecast4Days, dayToShowIndex: dayIndex,)) else Text('huy tam'),
        //  TimeScrollForecast(),
          //trytrtyur
         // Story1(),

       // if (data!=null && dataForecast!=null ) Expanded(
       //    // flex: 1,
       //    child:  Story1(),
       //  ) else SizedBox(),
        // SizedBox(height: 300,
        // width: 300,
        // child: Expanded(child: Text('fdfdfd')),),
        Container(
         // margin: EdgeInsets.only(bottom: 300),
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 12,),
         // margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Color(0xFF001026).withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Color(0x00000040))]
          ),
          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.icons.kapli.svg(),
//if(data!=null) Text(data!..toString()) else CircularProgressIndicator(),
              Assets.icons.termometr.svg(),
             if(data!=null) Text('${((data!.main!.temp!-273).toInt()).toString()}') else CircularProgressIndicator(),
              Assets.icons.wind.svg(),
              if(data!=null) Text("${data!.wind!.speed.toString()}m/s") else CircularProgressIndicator(),
          ],),

        ),
        //  TextButton(onPressed: (){PlaceApiProvider().fetchSuggestions('Мос', 'ru');}, child: Text('ok')),
        //  TextButton(onPressed: (){}, child: Text('ok'))
        if (dataForecast!=null)  Expanded(child: ListForecast(data: dataForecast)) else CircularProgressIndicator(),
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
      padding: EdgeInsets.only(left: 30,right: 30,top: 10)

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



class ListForecast extends StatelessWidget {
  final ForecastResponse? data;
   ListForecast({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
    return ListView.builder(
          shrinkWrap: true,
          itemCount: data!.forecast4Days!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => context.read<MainCubit>().changeDayForecasting(index),
              child: ListTile(
                  leading: const Icon(Icons.list),
                  trailing:  Text(
                    "${data!.forecast4Days![index].last.dtTxt}",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),

                  title: Text(" $index")),
            );
          });

  }
}


class NowWeatherView extends StatelessWidget {
  const NowWeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'ru';
   // var now = DateFormat("yyyy-MM-dd hh:mm").format(DateTime.now());
    final hour = DateTime.now().hour;
    final dateString = DateFormat("EEEE dd-MM $hour:mm").format(DateTime.now());
    return Column(children: [
      Text('${dateFormatter(DateTime.now())}'),
      Text('${dateString}')
    ],);
  }
}


class TimeScrollForecast extends StatelessWidget {
  final List<List<ForecastDateList>>? data;
  final int dayToShowIndex;
  const TimeScrollForecast({Key? key, this.data, required this.dayToShowIndex, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
   // var a = data!.where((element) => format.parse(element.dtTxt!).day==DateTime.now().day).toList();
  //  var fdfd = data!.firstIndexNextDay;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount:  data![dayToShowIndex]!.length,
        itemBuilder: (BuildContext context, int index) {
          return  Text("$index ${data![dayToShowIndex][index].dtTxt}");
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






