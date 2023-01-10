import 'package:json_annotation/json_annotation.dart';
part 'locations.g.dart';
@JsonSerializable()
class Locations {
  String countryIsoCode;

  Locations({required this.countryIsoCode});

  factory Locations.fromJson(Map<String, dynamic> json) => _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}