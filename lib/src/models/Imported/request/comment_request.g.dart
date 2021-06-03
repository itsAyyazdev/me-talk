// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) {
  return CommentRequest(
      json['review_id'] as String,
      json['review_type_id'] as String,
      json['role_id'] as int,
      json['comment'] as String);
}

Map<String, dynamic> _$CommentRequestToJson(CommentRequest instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'review_type_id': instance.reviewTypeId,
      'role_id': instance.roleId,
      'comment': instance.comment
    };
