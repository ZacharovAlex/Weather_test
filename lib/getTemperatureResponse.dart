import 'package:json_annotation/json_annotation.dart';
part 'getTemperatureResponse.g.dart';
@JsonSerializable()
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel);

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

}