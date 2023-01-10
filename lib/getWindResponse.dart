
import 'package:json_annotation/json_annotation.dart';
part 'getWindResponse.g.dart';
@JsonSerializable()
class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind(this.speed, this.deg, this.gust);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}