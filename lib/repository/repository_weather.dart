import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../coord.dart';
import '../getWeatherResponse.dart';
import '../open_weather_models/forecast_model/forecastResponse.dart';
import '../wether_api.dart';
@singleton
class WeatherRepository {
  final WetherApi _weatherApi;
  WeatherRepository(this._weatherApi);


  Future<getWetherFromCoordinates?> getWeatherRightAway(String? lat,String? lon,String? city,) async {
    print('gfgfgf');
    try {
      print('gfgfgf');
      var response = await _weatherApi.getWeatherRightAway(lat,lon,city,'1ca4000c3a81765bcd106423bf367de7','ru','metric');

    //  var response = await _weatherApi.getWeather(coordinate.latitude.toString(), coordinate.longitude.toString(), '1ca4000c3a81765bcd106423bf367de7','ru');
      print(response);
      print('otvet response ');
      try {
      //  var wether = getWetherFromCoordinates.fromJson(response.data);
        print('temp');
        print(response.main?.temp);
        print('city');
        print(response.name);

      } catch (e){
        print(e);
      }
      return response;
    } catch (e) {
      return null;
    }

  }

  Future<ForecastResponse?> getWeatherForecast(String? lat,String? lon,String? city,) async {
    print('gfgfgf');
    try {
      print('gfgfgf');
      var response = await _weatherApi.getWeatherForecast(lat,lon,city,'1ca4000c3a81765bcd106423bf367de7','ru','metric');

      //  var response = await _weatherApi.getWeather(coordinate.latitude.toString(), coordinate.longitude.toString(), '1ca4000c3a81765bcd106423bf367de7','ru');
      print(response);
      print('otvet response ');
      try {
        //  var wether = getWetherFromCoordinates.fromJson(response.data);


      } catch (e){
        print(e);
      }
      return response;
    } catch (e) {
      return null;
    }

  }
}