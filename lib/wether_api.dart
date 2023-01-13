
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'getWeatherResponse.dart';

part 'wether_api.g.dart';
@RestApi()
abstract class WetherApi {
  factory WetherApi(Dio dio) = _WetherApi;

  @GET('/weather')
  @FormUrlEncoded()
  Future<getWetherFromCoordinates> getWeather(
  @Query('lat') String? lat,
  @Query('lon') String? lon,
     @Query('q') String? q,
  @Query('appid') String appid,
  @Query('lang') String lang
     // @Query(String lat) String lat,
     // @Part() String lon,
     // @Part() String appid,
      );

}

