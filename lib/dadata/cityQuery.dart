import 'package:json_annotation/json_annotation.dart';

import 'fromBound.dart';
import 'locations.dart';
part 'cityQuery.g.dart';

@JsonSerializable()
class CityQuery {
  String query;
  FromBound fromBound;
  FromBound toBound;
  List<Locations> locations;

  CityQuery({required this.query, required this.fromBound, required this.toBound, required this.locations});

  factory CityQuery.fromJson(Map<String, dynamic> json) => _$CityQueryFromJson(json);
 // factory CityQuery.toJson(<String, dynamic> json) => _$CityQueryToJson(json);
  Map<String, dynamic> toJson() => _$CityQueryToJson(this);


}
