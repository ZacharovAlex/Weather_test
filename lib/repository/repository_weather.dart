import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../coord.dart';
import '../getWeatherResponse.dart';
import '../open_weather_models/forecast_model/forecastResponse.dart';
import '../utils/boundary.dart';
import '../wether_api.dart';
@singleton
class WeatherRepository {
  final WetherApi _weatherApi;
  WeatherRepository(this._weatherApi);


  Future<getWetherFromCoordinates?> getWeatherRightAway(String? lat,String? lon,String? city,) async {

    try {
      var response = await _weatherApi.getWeatherRightAway(lat,lon,city,'1ca4000c3a81765bcd106423bf367de7','ru','metric');

      if (response!=null) {

        return NetworkBoundary(data: response.data!);
      }


      return response;
    } catch (e) {
      return null;
    }

  }

  Future<ForecastResponse?> getWeatherForecast(String? lat,String? lon,String? city,) async {
    try {
      var response = await _weatherApi.getWeatherForecast(lat,lon,city,'1ca4000c3a81765bcd106423bf367de7','ru','metric');
      return response;
    } catch (e) {
      return null;
    }

  }
}