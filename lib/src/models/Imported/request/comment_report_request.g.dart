// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReportRequest _$CommentReportRequestFromJson(Map<String, dynamic> json) {
  return CommentReportRequest(json['review_comment_id'] as int,
      json['role_id'] as int, json['reason'] as String);
}

Map<String, dynamic> _$CommentReportRequestToJson(
        CommentReportRequest instance) =>
    <String, dynamic>{
      'review_comment_id': instance.reviewCommentId,
      'role_id': instance.roleId,
      'reason': instance.reason
    };
