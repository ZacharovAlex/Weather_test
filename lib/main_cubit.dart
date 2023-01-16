import 'dart:async';
import 'dart:ui';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_simple/repository/repository_weather.dart';

import 'coord.dart';
import 'getWeatherResponse.dart';
import 'main_state.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';


@injectable
class MainCubit extends Cubit<MainState> {
  final WeatherRepository _weatherRepository;

  MainCubit(@factoryParam getWetherFromCoordinates? weather,@factoryParam ForecastResponse? weatherForecast, this._weatherRepository) : super(MainState(weatherResponse: weather,forecastResponse: weatherForecast)) {
    if (weather == null) {
      _getWeatherFromCoordinates();
     // _getWeatherFromCity();
    }
  }
  void changeDayForecasting(int dayForecastToView) {
    print('$dayForecastToView');
    emit(state.copyWith(dayForecasting: dayForecastToView));
  }


  Future<void> _getWeatherFromCoordinates() async {
    var coordinate = await determinePosition();
    final data = await _weatherRepository.getWeatherRightAway(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    final dataForecast = await _weatherRepository.getWeatherForecast(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    emit(state.copyWith(weatherResponse: data));
    emit(state.copyWith(forecastResponse: dataForecast));
  }

  Future<void> _getWeatherFromCity() async {
    final data = await _weatherRepository.getWeatherRightAway(null,null,'Александров');
    emit(state.copyWith(weatherResponse: data));
  }

  changeCity() {
  //  _getWeatherFromCoordinates();
    _getWeatherFromCity();
  }

}
