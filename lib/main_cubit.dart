import 'dart:async';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_simple/repository/repository_weather.dart';
import 'package:weather_simple/utils/boundary.dart';

import 'coord.dart';
import 'enum_now_or_forecast.dart';
import 'errors/network_connection_error.dart';
import 'getWeatherResponse.dart';
import 'main_state.dart';
import 'open_weather_models/forecast_model/foercastListDate.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';


@injectable
class MainCubit extends Cubit<MainState> {
  final WeatherRepository _weatherRepository;
  ConnectivityResult _connectivityStatus = ConnectivityResult.none;
  late final StreamSubscription _connectivitySubscription;
  MainCubit(@factoryParam getWetherFromCoordinates? weather,@factoryParam ForecastResponse? weatherForecast, this._weatherRepository) : super(MainState(weatherResponse: weather,forecastResponse: weatherForecast)) {
    if (weather == null) {
      _getWeatherFromCoordinates();
     // _getWeatherFromCity();

    }
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      _connectivityStatus = result;
    });
  }
  void changeDayForecasting(int dayForecastToView) {
    emit(state.copyWith(dayForecasting: dayForecastToView));
  }

  void changeNowOrForecast(NowOrForecast change) {
    emit(state.copyWith(nowOrForecast: change));
  }


  Future<void> _getWeatherFromCoordinates() async {

    var coordinate = await determinePosition();
    if (_connectivityStatus == ConnectivityResult.none) {
      return emit(state.copyWith(error: const NetworkConnectionError()));
    }
    final result = await _weatherRepository.getWeatherRightAway(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    final dataForecast = await _weatherRepository.getWeatherForecast(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    var data = (result).data;
    var error = (result).error;
    if (data != null) {
      emit(state.copyWith(weatherResponse: data));
    }else {
      emit(state.copyWith( error: error));
    }
   // emit(state.copyWith(weatherResponse: data.data));
    if (dataForecast!=null) {
      emit(state.copyWith(arrayForecastByDays: forecastArrayByDays(dataForecast.list)));
    }
    emit(state.copyWith(forecastResponse: dataForecast));
  }

  void errorHandled() {
    emit(state.copyWith(error: null));
  }

  Future<void> _getWeatherFromCity(String city) async {
    final data = await _weatherRepository.getWeatherRightAway(null,null,city);
    final dataForecast = await _weatherRepository.getWeatherForecast(null,null,city);
    emit(state.copyWith(weatherResponse: data.data));
   if (dataForecast!=null) {
      emit(state.copyWith(arrayForecastByDays: forecastArrayByDays(dataForecast.list)));
    }
    emit(state.copyWith(forecastResponse: dataForecast));
  }

  changeCity(String city) {
  //  _getWeatherFromCoordinates();
    _getWeatherFromCity(city);
  }

  List<List<ForecastDateList>>? forecastArrayByDays(List<ForecastDateList>? list) {
    DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");

    List<List<ForecastDateList>> ff = [];
    final indexNextDay = list!.lastIndexWhere((element) => format.parse(element.dtTxt!).day==DateTime.now().day);
    final toDay3hForecastList =  list.sublist(0,indexNextDay+1);
    ff.add(toDay3hForecastList);
    ff.add(list.sublist(indexNextDay+1,indexNextDay+9));
    ff.add(list.sublist(indexNextDay+9,indexNextDay+17));
    ff.add(list.sublist(indexNextDay+17,indexNextDay+25));
    ff.add(list.sublist(indexNextDay+25,indexNextDay+32));
    return ff;
  }

}
