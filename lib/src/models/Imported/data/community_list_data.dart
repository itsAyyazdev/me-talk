import 'package:json_annotation/json_annotation.dart';


part 'community_list_data.g.dart';

@JsonSerializable()
class CommunityListData {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_name")
  String userName;
  @JsonKey(name: "sub_category_name")
  String subCategoryName;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "time_difference")
  String timeDifference;
  @JsonKey(name: "comments_count")
  int commentsCount;
  @JsonKey(name: "views_count")
  int viewsCount;

  CommunityListData(this.id, this.userName, this.subCategoryName, this.title,
      this.description, this.createdAt, this.timeDifference, this.commentsCount,
      this.viewsCount);

  factory CommunityListData.fromJson(Map<String, dynamic> json) =>
      _$CommunityListDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityListDataToJson(this);


}