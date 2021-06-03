// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePostRequest _$SavePostRequestFromJson(Map<String, dynamic> json) {
  return SavePostRequest(json['history_id'] as int,
      json['history_type_id'] as int, json['role_id'] as int);
}

Map<String, dynamic> _$SavePostRequestToJson(SavePostRequest instance) =>
    <String, dynamic>{
      'history_id': instance.historyId,
      'history_type_id': instance.historyTypeId,
      'role_id': instance.roleId
    };
