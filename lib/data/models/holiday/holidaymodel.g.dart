// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holidaymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidaysModel _$HolidaysModelFromJson(Map<String, dynamic> json) =>
    HolidaysModel(
      date: json['date'] as String?,
      localName: json['localName'] as String?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      fixed: json['fixed'] as bool?,
      global: json['global'] as bool?,
      counties: (json['counties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      launchYear: json['launchYear'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$HolidaysModelToJson(HolidaysModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'localName': instance.localName,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'fixed': instance.fixed,
      'global': instance.global,
      'counties': instance.counties,
      'launchYear': instance.launchYear,
      'type': instance.type,
    };
