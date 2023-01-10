// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suggestions _$SuggestionsFromJson(Map<String, dynamic> json) => Suggestions(
      value: json['value'] as String?,
      unrestrictedValue: json['unrestrictedValue'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SuggestionsToJson(Suggestions instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unrestrictedValue': instance.unrestrictedValue,
      'data': instance.data,
    };
