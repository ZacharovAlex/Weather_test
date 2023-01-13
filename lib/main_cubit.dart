import 'dart:async';
import 'dart:ui';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_simple/repository/repository_weather.dart';

import 'coord.dart';
import 'getWeatherResponse.dart';
import 'main_state.dart';


@injectable
class MainCubit extends Cubit<MainState> {
  final WeatherRepository _weatherRepository;

  MainCubit(@factoryParam getWetherFromCoordinates? weather, this._weatherRepository) : super(MainState(weatherResponse: weather)) {
    if (weather == null) {
      _getWeatherFromCoordinates();
     // _getWeatherFromCity();
    }
  }

  Future<void> _getWeatherFromCoordinates() async {
    var coordinate = await determinePosition();
    final data = await _weatherRepository.getWeather(coordinate.latitude.toString(),coordinate.longitude.toString(),null);
    emit(state.copyWith(weatherResponse: data));
  }

  Future<void> _getWeatherFromCity() async {
    final data = await _weatherRepository.getWeather(null,null,'Александров');
    emit(state.copyWith(weatherResponse: data));
  }

  changeCity() {
  //  _getWeatherFromCoordinates();
    _getWeatherFromCity();
  }

}
