// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityListResponse _$CommunityListResponseFromJson(
    Map<String, dynamic> json) {
  return CommunityListResponse((json['data'] as List)
      ?.map((e) => e == null
          ? null
          : CommunityListData.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..statusCode = json['status_code'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CommunityListResponseToJson(
        CommunityListResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
