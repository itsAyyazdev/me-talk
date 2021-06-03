// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityDetailResponse _$CommunityDetailResponseFromJson(
    Map<String, dynamic> json) {
  return CommunityDetailResponse(
      json['message'] as String,
      json['status_code'] as int,
      json['data'] == null
          ? null
          : CommunityDetailData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CommunityDetailResponseToJson(
        CommunityDetailResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
