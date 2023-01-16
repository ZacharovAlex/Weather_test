import 'package:json_annotation/json_annotation.dart';
import 'package:weather_simple/getTemperatureResponse.dart';
import 'package:weather_simple/getCloudResponse.dart';
import 'package:weather_simple/getWindResponse.dart';
import '../../wetherResponse.dart';
import 'rainForrercast.dart';
part 'foercastListDate.g.dart';
@JsonSerializable()
class ForecastDateList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;
 // Sys? sys;
  @JsonKey(name:'dt_txt')
  String? dtTxt;

  ForecastDateList(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.rain,
      //  this.sys,
        this.dtTxt});

  factory ForecastDateList.fromJson(Map<String, dynamic> json) => _$ForecastDateListFromJson(json);
 // int get firstIndexNextDay =>
}
