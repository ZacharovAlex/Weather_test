// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityQuery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityQuery _$CityQueryFromJson(Map<String, dynamic> json) => CityQuery(
      query: json['query'] as String,
      fromBound: FromBound.fromJson(json['fromBound'] as Map<String, dynamic>),
      toBound: FromBound.fromJson(json['toBound'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Locations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityQueryToJson(CityQuery instance) => <String, dynamic>{
      'query': instance.query,
      'fromBound': instance.fromBound,
      'toBound': instance.toBound,
      'locations': instance.locations,
    };
