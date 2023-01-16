
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'getWeatherResponse.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';

part 'wether_api.g.dart';
@RestApi()
abstract class WetherApi {
  factory WetherApi(Dio dio) = _WetherApi;

  @GET('/weather')
  @FormUrlEncoded()
  Future<getWetherFromCoordinates> getWeatherRightAway(
  @Query('lat') String? lat,
  @Query('lon') String? lon,
     @Query('q') String? q,
  @Query('appid') String appid,
  @Query('lang') String lang,
  @Query('units') String units

     // @Query(String lat) String lat,
     // @Part() String lon,
     // @Part() String appid,
      );
  @GET('/forecast')
  @FormUrlEncoded()
  Future<ForecastResponse> getWeatherForecast(
      @Query('lat') String? lat,
      @Query('lon') String? lon,
      @Query('q') String? q,
      @Query('appid') String appid,
      @Query('lang') String lang,
  @Query('units') String units
      // @Query(String lat) String lat,
      // @Part() String lon,
      // @Part() String appid,
      );

}

