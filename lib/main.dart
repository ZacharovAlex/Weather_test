
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_simple/repository/repostory_dadata.dart';
import 'addrressSearch.dart';
import 'animation/anim_weather.dart';
import 'dadata/autocompleteApi.dart';
import 'di/injectable.dart';
import 'getWeatherResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_cubit.dart';
import 'gen/assets/assets.gen.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

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
   // final tempcelc = (data!.main!.temp!-270).toInt();
    return Padding(padding: const EdgeInsets.only(top: 40),child:
        Column(children: [
          TopCity(), //trytrtyur
         // Story1(),

       if (data!=null && dataForecast!=null ) Expanded(
          // flex: 1,
          child:  Story1(),
        ) else SizedBox(),
        // SizedBox(height: 300,
        // width: 300,
        // child: Expanded(child: Text('fdfdfd')),),
        Container(
          margin: EdgeInsets.only(bottom: 300),
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
              if (dataForecast!=null) Text('${dataForecast.list![1].main!.temp.toString()}') else CircularProgressIndicator(),
             if(data!=null) Text('${((data!.main!.temp!-273).toInt()).toString()}') else CircularProgressIndicator(),
              Assets.icons.wind.svg(),
              if(data!=null) Text("${data!.wind!.speed.toString()}m/s") else CircularProgressIndicator(),
          ],),
        )

        //  TextButton(onPressed: (){PlaceApiProvider().fetchSuggestions('Мос', 'ru');}, child: Text('ok')),
        //  TextButton(onPressed: (){}, child: Text('ok'))
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
      padding: EdgeInsets.only(left: 30,right: 30,top: 30)

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






