// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponse _$CategoryListResponseFromJson(Map<String, dynamic> json) {
  return CategoryListResponse((json['data'] as List)
      ?.map((e) => e == null
          ? null
          : CategoryListData.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..statusCode = json['status_code'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
