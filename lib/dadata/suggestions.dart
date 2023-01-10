
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'suggestions.g.dart';
@JsonSerializable()
class Suggestions {
  String? value;
  String? unrestrictedValue;
  Data? data;

  Suggestions({this.value, this.unrestrictedValue, this.data});

  factory Suggestions.fromJson(Map<String, dynamic> json) => _$SuggestionsFromJson(json);
}