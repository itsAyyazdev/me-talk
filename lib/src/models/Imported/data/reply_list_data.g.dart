// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyListData _$ReplyListDataFromJson(Map<String, dynamic> json) {
  return ReplyListData(
      json['name'] as String,
      json['avatar'] as String,
      json['id'] as int,
      json['reply'] as String,
      json['created_at'] as String,
      json['time_difference'] as String);
}

Map<String, dynamic> _$ReplyListDataToJson(ReplyListData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'id': instance.id,
      'reply': instance.reply,
      'created_at': instance.createdAt,
      'time_difference': instance.timeDifference
    };
