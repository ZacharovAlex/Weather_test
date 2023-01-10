
import 'package:json_annotation/json_annotation.dart';
part 'fromBound.g.dart';
@JsonSerializable()
class FromBound {
  String value;

  FromBound({required this.value});

  factory FromBound.fromJson(Map<String, dynamic> json) => _$FromBoundFromJson(json);
  Map<String, dynamic> toJson() => _$FromBoundToJson(this);
}