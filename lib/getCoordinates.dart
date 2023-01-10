import 'package:json_annotation/json_annotation.dart';
part 'getCoordinates.g.dart';

@JsonSerializable()
class Coord {
  double? lon;
  double? lat;

  Coord(this.lon, this.lat);

 factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

}