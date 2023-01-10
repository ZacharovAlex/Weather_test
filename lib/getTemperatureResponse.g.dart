// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getTemperatureResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      (json['temp'] as num?)?.toDouble(),
      (json['feelsLike'] as num?)?.toDouble(),
      (json['tempMin'] as num?)?.toDouble(),
      (json['tempMax'] as num?)?.toDouble(),
      json['pressure'] as int?,
      json['humidity'] as int?,
      json['seaLevel'] as int?,
      json['grndLevel'] as int?,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'seaLevel': instance.seaLevel,
      'grndLevel': instance.grndLevel,
    };
