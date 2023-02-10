

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget pressureMmRtutniyStolb(int hPaskal,double fontSize){
  const int minNormalPressure = 750;
  const int maxNormalPressure = 763;

  late Color color;
  final press = hPaskal*0.7500637554192;
  if(press>minNormalPressure&&press<maxNormalPressure) {color=Colors.black;}
  if(press<minNormalPressure) {color=Colors.blue;}
  if(press>maxNormalPressure) {color=Colors.deepOrangeAccent;}
  return
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('${press.round()}',style: TextStyle(color: color,fontSize: fontSize ),),
    Text('mm',style: TextStyle(color: color,fontSize: 10 ),),
  ],);
  // 1 гектопаскаль = 0.7500637554192 миллиметр ртутного столба (0°C)
}