import 'dart:async';
import 'dart:ui';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_simple/repository/repository_weather.dart';

import 'coord.dart';
import 'enum_now_or_forecast.dart';
import 'getWeatherResponse.dart';
import 'main_state.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';


@injectable
class MainCubit extends Cubit<MainState> {
  final WeatherRepository _weatherRepository;

  MainCubit(@factoryParam getWetherFromCoordinates? weather,@factoryParam ForecastResponse? weatherForecast, this._weatherRepository) : super(MainState(weatherResponse: weather,forecastResponse: weatherForecast)) {
    if (weather == null) {
     // _getWeatherFromCoordinates();
      _getWeatherFromCity();
    }
  }
  void changeDayForecasting(int dayForecastToView) {
    emit(state.copyWith(dayForecasting: dayForecastToView));
  }

  void changeNowOrForecast(NowOrForecast change) {
    emit(state.copyWith(nowOrForecast: change));
  }


  Future<void> _getWeatherFromCoordinates() async {
    var coordinate = await determinePosition();
    final data = await _weatherRepository.getWeatherRightAway(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    final dataForecast = await _weatherRepository.getWeatherForecast(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    emit(state.copyWith(weatherResponse: data));
    emit(state.copyWith(forecastResponse: dataForecast));
  }

  Future<void> _getWeatherFromCity() async {
    final data = await _weatherRepository.getWeatherRightAway(null,null,'Мытищи');
    final dataForecast = await _weatherRepository.getWeatherForecast(null,null,'Мытищи');
    emit(state.copyWith(weatherResponse: data));
    emit(state.copyWith(forecastResponse: dataForecast));
  }

  changeCity() {
  //  _getWeatherFromCoordinates();
    _getWeatherFromCity();
  }

}
