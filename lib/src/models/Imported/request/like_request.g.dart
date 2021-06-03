// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeRequest _$LikeRequestFromJson(Map<String, dynamic> json) {
  return LikeRequest(
      json['review_id'] as String,
      json['review_type_id'] as String,
      json['role_id'] as int,
      json['is_like'] as int);
}

Map<String, dynamic> _$LikeRequestToJson(LikeRequest instance) =>
    <String, dynamic>{
      'role_id': instance.roleId,
      'review_type_id': instance.reviewTypeId,
      'review_id': instance.reviewId,
      'is_like': instance.isLike
    };
