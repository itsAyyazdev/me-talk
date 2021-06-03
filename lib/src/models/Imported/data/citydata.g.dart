// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citydata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityData _$CityDataFromJson(Map<String, dynamic> json) {
  return CityData(
      json['name'] as String, json['id'] as int, json['state_id'] as int);
}

Map<String, dynamic> _$CityDataToJson(CityData instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'state_id': instance.stateId
    };
