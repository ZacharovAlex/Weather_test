import 'package:json_annotation/json_annotation.dart';
import 'foercastListDate.dart';
import 'cityResponse.dart';
part 'forecastResponse.g.dart';
@JsonSerializable()
class ForecastResponse {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastDateList>? list;
  City? city;

  ForecastResponse({this.cod, this.message, this.cnt, this.list, this.city});

 factory ForecastResponse.fromJson(Map<String, dynamic> json) => _$ForecastResponseFromJson(json);
}