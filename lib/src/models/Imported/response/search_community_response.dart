



import 'package:me_talk/src/models/Imported/data/community_list_data.dart';

class SearchCommunityResponse{
  List<CommunityListData> data;
  String message;
  int statusCode;

  SearchCommunityResponse({this.data, this.message, this.statusCode});

  SearchCommunityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CommunityListData>();
      json['data'].forEach((v) {
        data.add(new CommunityListData.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class SearchCommunityData {
  int id;
  String userName;
  String subCategoryName;
  String title;
  String description;
  String createdAt;
  String timeDifference;
  int commentsCount;
  int viewsCount;

  SearchCommunityData(
      {this.id,
        this.userName,
        this.subCategoryName,
        this.title,
        this.description,
        this.createdAt,
        this.timeDifference,
        this.commentsCount,
        this.viewsCount});

  SearchCommunityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    subCategoryName = json['sub_category_name'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    timeDifference = json['time_difference'];
    commentsCount = json['comments_count'];
    viewsCount = json['views_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['sub_category_name'] = this.subCategoryName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['time_difference'] = this.timeDifference;
    data['comments_count'] = this.commentsCount;
    data['views_count'] = this.viewsCount;
    return data;
  }
}
