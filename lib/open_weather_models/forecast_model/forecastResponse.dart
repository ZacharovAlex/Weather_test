import 'package:intl/intl.dart';
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


  List<ForecastDateList>? get toDay3hForecastList {
   DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
  final indexNextDay = list!.lastIndexWhere((element) => format.parse(element.dtTxt!).day==DateTime.now().day);
return list!.sublist(0,indexNextDay+1);
 }
 List<List<ForecastDateList>>? get forecast4Days {
   DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
   List<List<ForecastDateList>> ff = [];
   final indexNextDay = list!.lastIndexWhere((element) => format.parse(element.dtTxt!).day==DateTime.now().day);
   ff.add(toDay3hForecastList!);
   ff.add(list!.sublist(indexNextDay+1,indexNextDay+9));
   ff.add(list!.sublist(indexNextDay+9,indexNextDay+17));
   ff.add(list!.sublist(indexNextDay+17,indexNextDay+25));
   ff.add(list!.sublist(indexNextDay+25,indexNextDay+32));
   return ff;
 }
 // String  dayTemperatureWhole(List<ForecastDateList> bb){
 //    return bb.;
 // }

 
}