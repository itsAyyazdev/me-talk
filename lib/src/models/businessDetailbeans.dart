class BusinessDetailBeans {
  BusinessDetailData data;
  Null otherData;
  String message;
  int statusCode;
  int requestStatus;

  BusinessDetailBeans(
      {this.data,
      this.otherData,
      this.message,
      this.statusCode,
      this.requestStatus});

  BusinessDetailBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new BusinessDetailData.fromJson(json['data'])
        : null;
    otherData = json['other_data'];
    message = json['message'];
    statusCode = json['status_code'];
    requestStatus = json['request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['other_data'] = this.otherData;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['request_status'] = this.requestStatus;
    return data;
  }
}

class BusinessDetailData {
  int id;
  String name;
  String credits;
  String photo;
  String licence;
  String lat;
  String long;
  String address;
  String cityName;
  String email;
  int phoneCode;
  String phoneNumber;
  String recommendedCode;
  String identification;
  List<SubCategories> subCategories;
  List<String> sliders;

  BusinessDetailData(
      {this.id,
      this.name,
      this.credits,
      this.photo,
      this.licence,
      this.lat,
      this.long,
      this.address,
      this.cityName,
      this.email,
      this.phoneCode,
      this.phoneNumber,
      this.recommendedCode,
      this.identification,
      this.subCategories,
      this.sliders});

  BusinessDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    credits = json['credits'];
    photo = json['photo'];
    licence = json['licence'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    cityName = json['city_name'];
    email = json['email'];
    phoneCode = json['phone_code'];
    phoneNumber = json['phone_number'];
    recommendedCode = json['recommended_code'];
    identification = json['identification'];
    if (json['sub_categories'] != null) {
      subCategories = new List<SubCategories>();
      json['sub_categories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
    sliders = json['sliders'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['credits'] = this.credits;
    data['photo'] = this.photo;
    data['licence'] = this.licence;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['address'] = this.address;
    data['city_name'] = this.cityName;
    data['email'] = this.email;
    data['phone_code'] = this.phoneCode;
    data['phone_number'] = this.phoneNumber;
    data['recommended_code'] = this.recommendedCode;
    data['identification'] = this.identification;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['sliders'] = this.sliders;
    return data;
  }
}

class SubCategories {
  int categoryProfileId;
  int categoryId;
  String categoryName;
  String icon;
  int followers;
  int workComplete;
  int portfolio;
  int review;
  int categoryStatus;

  SubCategories(
      {this.categoryProfileId,
      this.categoryId,
      this.categoryName,
      this.icon,
      this.followers,
      this.workComplete,
      this.portfolio,
      this.review,
      this.categoryStatus});

  SubCategories.fromJson(Map<String, dynamic> json) {
    categoryProfileId = json['category profile_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    icon = json['icon'];
    followers = json['followers'];
    workComplete = json['work_complete'];
    portfolio = json['portfolio'];
    review = json['review'];
    categoryStatus = json['category_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category profile_id'] = this.categoryProfileId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['icon'] = this.icon;
    data['followers'] = this.followers;
    data['work_complete'] = this.workComplete;
    data['portfolio'] = this.portfolio;
    data['review'] = this.review;
    data['category_status'] = this.categoryStatus;
    return data;
  }
}
