class HomePageDataBeans {
  HomePageData data;
  Null otherData;
  String message;
  int statusCode;

  HomePageDataBeans({this.data, this.otherData, this.message, this.statusCode});

  HomePageDataBeans.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new HomePageData.fromJson(json['data']) : null;
    otherData = json['other_data'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['other_data'] = this.otherData;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class HomePageData {
  List<String> sliders;

  List<Posts> posts;

  HomePageData({this.sliders, this.posts});

  HomePageData.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sliders'] = this.sliders;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int id;
  String name;
  List<Posts> posts;

  Posts({this.id, this.name, this.posts});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Postss {
  Postss.fromJson(Map<String, dynamic> json) ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
