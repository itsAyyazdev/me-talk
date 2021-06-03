// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_post_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedPostResponse _$FeaturedPostResponseFromJson(Map<String, dynamic> json) {
  return FeaturedPostResponse(
      json['status_code'] as int,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : FeaturedPostData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FeaturedPostResponseToJson(
        FeaturedPostResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
