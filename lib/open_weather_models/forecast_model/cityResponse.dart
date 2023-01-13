import 'package:json_annotation/json_annotation.dart';
import 'package:weather_simple/getCoordinates.dart';

part 'cityResponse.g.dart';
@JsonSerializable()
class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset});

 factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);


}