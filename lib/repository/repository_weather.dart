import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_simple/errors/api_error.dart';

import '../coord.dart';
import '../errors/error_parser.dart';
import '../getWeatherResponse.dart';
import '../open_weather_models/forecast_model/forecastResponse.dart';
import '../utils/boundary.dart';
import '../wether_api.dart';
@singleton
class WeatherRepository {
  final WetherApi _weatherApi;
  WeatherRepository(this._weatherApi);


  Future<NetworkBoundary<getWetherFromCoordinates>> getWeatherRightAway(String? lat,String? lon,String? city,) async {

    try {
      var response = await _weatherApi.getWeatherRightAway(lat,lon,city,'1ca4000c3a81765bcd106423bf367de7','ru','metric');

      if (response.main!=null) {

        return NetworkBoundary(data: response);
      } else{ throw ApiError(response.toString());}



    } catch (e) {
      return NetworkBoundary(error: parseError(e));
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