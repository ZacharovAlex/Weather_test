
import 'package:json_annotation/json_annotation.dart';
part 'getCityResponse.g.dart';
@JsonSerializable()
class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys(this.type, this.id, this.country, this.sunrise,this.sunset);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

}