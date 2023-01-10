import 'package:json_annotation/json_annotation.dart';
part 'getCloudResponse.g.dart';
@JsonSerializable()
class Clouds {
  late int? all;

  Clouds( this.all);

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }


}