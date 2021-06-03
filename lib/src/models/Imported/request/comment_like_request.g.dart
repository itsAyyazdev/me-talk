// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_like_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentLikeRequest _$CommentLikeRequestFromJson(Map<String, dynamic> json) {
  return CommentLikeRequest(json['review_comment_id'] as int,
      json['role_id'] as int, json['is_like'] as int);
}

Map<String, dynamic> _$CommentLikeRequestToJson(CommentLikeRequest instance) =>
    <String, dynamic>{
      'review_comment_id': instance.reviewCommentId,
      'role_id': instance.roleId,
      'is_like': instance.isLike
    };
