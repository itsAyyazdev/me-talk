// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityListData _$CommunityListDataFromJson(Map<String, dynamic> json) {
  return CommunityListData(
      json['id'] as int,
      json['user_name'] as String,
      json['sub_category_name'] as String,
      json['title'] as String,
      json['description'] as String,
      json['created_at'] as String,
      json['time_difference'] as String,
      json['comments_count'] as int,
      json['views_count'] as int);
}

Map<String, dynamic> _$CommunityListDataToJson(CommunityListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'sub_category_name': instance.subCategoryName,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
      'time_difference': instance.timeDifference,
      'comments_count': instance.commentsCount,
      'views_count': instance.viewsCount
    };
