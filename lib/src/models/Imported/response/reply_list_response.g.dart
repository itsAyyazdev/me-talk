// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyListResponse _$ReplyListResponseFromJson(Map<String, dynamic> json) {
  return ReplyListResponse(
      json['message'] as String,
      json['status_code'] as int,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ReplyListData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ReplyListResponseToJson(ReplyListResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
