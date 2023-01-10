

import 'wetherResponse.dart';

import 'getCityResponse.dart';
import 'getCloudResponse.dart';
import 'getCoordinates.dart';
import 'getTemperatureResponse.dart';
import 'getWindResponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'getWeatherResponse.g.dart';

@JsonSerializable()
class getWetherFromCoordinates {
  Coord? coord;
  List<Weather?> weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  getWetherFromCoordinates(
      this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod);

 factory getWetherFromCoordinates.fromJson(Map<String, dynamic> json) => _$getWetherFromCoordinatesFromJson(json);

}


