// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_reply_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReplyRequest _$CommentReplyRequestFromJson(Map<String, dynamic> json) {
  return CommentReplyRequest(json['review_comment_id'] as int,
      json['role_id'] as int, json['reply'] as String);
}

Map<String, dynamic> _$CommentReplyRequestToJson(
        CommentReplyRequest instance) =>
    <String, dynamic>{
      'review_comment_id': instance.reviewCommentId,
      'role_id': instance.roleId,
      'reply': instance.reply
    };
