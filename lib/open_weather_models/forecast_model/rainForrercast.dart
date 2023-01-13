import 'package:json_annotation/json_annotation.dart';

part 'rainForrercast.g.dart';
@JsonSerializable()
class Rain {
  double? d3h;

  Rain({this.d3h});

factory  Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}