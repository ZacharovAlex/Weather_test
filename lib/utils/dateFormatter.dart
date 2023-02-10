
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../enum_now_or_forecast.dart';

// Widget celsium(double data){
//   return
// }


String dateFormatter(DateTime date,NowOrForecast trigger) {
   String dayStr;
  if(trigger==NowOrForecast.now){dayStr='Сейчас';} else if (date.day==DateTime.now().day) {dayStr='Сегодня';}
  else if (date.day==DateTime.now().day+1){dayStr='Завтра';}
  else if (date.day==DateTime.now().day+2){dayStr='Послезавтра';}
  else dayStr='';
  dynamic dayData =
      '{ "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота", "7" : "Воскресенье" }';

  dynamic monthData =
      '{ "1" : "Января", "2" : "Февраля", "3" : "Марта", "4" : "Апреля", "5" : "Мая", "6" : "Июня", "7" : "Июля", "8" : "Августа", "9" : "Сентября", "10" : "Октября", "11" : "Ноября", "12" : "Декабря" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
    //  date.year.toString() +
      " " +
      dayStr;
}

String dateFormatterWeekday(DateTime date,NowOrForecast trigger) {
  String dayStr;
  dynamic dayData =
      '{ "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота", "7" : "Воскресенье" }';
  if(trigger==NowOrForecast.now){dayStr='Сейчас';} else if (date.day==DateTime.now().day) {dayStr='Сегодня';}
  else if (date.day==DateTime.now().day+1){dayStr='Завтра';}
  else if (date.day==DateTime.now().day+2){dayStr='Послезавтра';}
  else dayStr=json.decode(dayData)['${date.weekday}'];

  return dayStr ;
}
String dateFormatterDayMonth(DateTime date) {

  dynamic monthData =
      '{ "1" : "Января", "2" : "Февраля", "3" : "Марта", "4" : "Апреля", "5" : "Мая", "6" : "Июня", "7" : "Июля", "8" : "Августа", "9" : "Сентября", "10" : "Октября", "11" : "Ноября", "12" : "Декабря" }';

  return  date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] ;
}




DateTime dateParser(String dataTime) {
  DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
 return  format.parse(dataTime);
 //  var a = data!.where((element) => format.parse(element.dtTxt!).day==DateTime.now().day).toList();
}

String weekdayParser(DateTime data) {
  dynamic dayData =
      '{ "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота", "7" : "Воскресенье" }';
  return json.decode(dayData)['${data.weekday}'];
}