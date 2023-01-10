import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';
@JsonSerializable()
class Data {
  String? city;
  String? geoLat;
  String? geoLon;


  Data(
      {
        this.city,
        this.geoLat,
        this.geoLon,
      });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}