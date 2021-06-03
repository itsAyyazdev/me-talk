// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityListRequest _$CommunityListRequestFromJson(Map<String, dynamic> json) {
  return CommunityListRequest(
      json['role_id'] as int,
      json['category_id'] as int,
      json['sub_category_id'] as int,
      json['order_by'] as int,
      json['page_no'] as int);
}

Map<String, dynamic> _$CommunityListRequestToJson(
        CommunityListRequest instance) =>
    <String, dynamic>{
      'role_id': instance.roleId,
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'order_by': instance.orderBy,
      'page_no': instance.pageNo
    };
