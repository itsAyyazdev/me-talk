// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityDetailData _$CommunityDetailDataFromJson(Map<String, dynamic> json) {
  return CommunityDetailData(
      json['id'] as int,
      json['avatar'] as String,
      json['user_name'] as String,
      json['category_name'] as String,
      json['sub_category_name'] as String,
      json['title'] as String,
      json['description'] as String,
      json['created_at'] as String,
      json['image'] as String,
      json['views_count'] as int,
      json['comments_count'] as int,
      json['likes_count'] as int,
      json['bitly_url'] as String,
      (json['comments'] as List)
          ?.map((e) => e == null
              ? null
              : CommunityCommentsData.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..userIsLike = json['user_is_like'] as int;
}

Map<String, dynamic> _$CommunityDetailDataToJson(
        CommunityDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'user_name': instance.userName,
      'category_name': instance.categoryName,
      'sub_category_name': instance.subCategoryName,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
      'image': instance.image,
      'views_count': instance.viewsCount,
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'bitly_url': instance.bitlyUrl,
      'user_is_like': instance.userIsLike,
      'comments': instance.comments
    };

CommunityCommentsData _$CommunityCommentsDataFromJson(
    Map<String, dynamic> json) {
  return CommunityCommentsData(
      json['id'] as int,
      json['name'] as String,
      json['avatar'] as String,
      json['comment'] as String,
      json['reply_comment_count'] as int,
      json['review_comment_like_count'] as int,
      json['created_at'] as String,
      json['time_difference'] as String,
      json['user_comment_like'] as int);
}

Map<String, dynamic> _$CommunityCommentsDataToJson(
        CommunityCommentsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'comment': instance.comment,
      'reply_comment_count': instance.replyCommentCount,
      'review_comment_like_count': instance.reviewCommentLikeCount,
      'created_at': instance.createdAt,
      'time_difference': instance.timeDifference,
      'user_comment_like': instance.userCommentLike
    };
