// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPostRequest _$ReportPostRequestFromJson(Map<String, dynamic> json) {
  return ReportPostRequest(
      json['review_id'] as int,
      json['review_type_id'] as int,
      json['role_id'] as int,
      json['reason'] as String);
}

Map<String, dynamic> _$ReportPostRequestToJson(ReportPostRequest instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'review_type_id': instance.reviewTypeId,
      'role_id': instance.roleId,
      'reason': instance.reason
    };
