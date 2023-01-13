import 'package:json_annotation/json_annotation.dart';
part 'weatherResponse.g.dart';
@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

 factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}