import 'package:json_annotation/json_annotation.dart';

part 'community_detail_data.g.dart';

@JsonSerializable()
class CommunityDetailData {

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "user_name")
  String userName;
  @JsonKey(name: "category_name")
  String categoryName;
  @JsonKey(name: "sub_category_name")
  String subCategoryName;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "views_count")
  int viewsCount;
  @JsonKey(name: "comments_count")
  int commentsCount;
  @JsonKey(name: "likes_count")
  int likesCount;
  @JsonKey(name: "bitly_url")
  String bitlyUrl;
  @JsonKey(name: "user_is_like")
  int userIsLike;


  List<CommunityCommentsData> comments;

  CommunityDetailData(this.id, this.avatar, this.userName, this.categoryName,
      this.subCategoryName, this.title, this.description, this.createdAt,
      this.image, this.viewsCount, this.commentsCount, this.likesCount,
      this.bitlyUrl, this.comments);

  factory CommunityDetailData.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityDetailDataToJson(this);

}


@JsonSerializable()
class CommunityCommentsData{

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "reply_comment_count")
  int replyCommentCount;
  @JsonKey(name: "review_comment_like_count")
  int reviewCommentLikeCount;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "time_difference")
  String timeDifference;
  @JsonKey(name: "user_comment_like")
  int userCommentLike;

  CommunityCommentsData(this.id, this.name, this.avatar, this.comment,
      this.replyCommentCount, this.reviewCommentLikeCount, this.createdAt,
      this.timeDifference, this.userCommentLike);


  factory CommunityCommentsData.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityCommentsDataToJson(this);

}