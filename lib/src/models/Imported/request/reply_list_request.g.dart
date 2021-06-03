// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyListRequest _$ReplyListRequestFromJson(Map<String, dynamic> json) {
  return ReplyListRequest(
      json['review_comment_id'] as int, json['role_id'] as int);
}

Map<String, dynamic> _$ReplyListRequestToJson(ReplyListRequest instance) =>
    <String, dynamic>{
      'review_comment_id': instance.reviewCommentId,
      'role_id': instance.roleId
    };
