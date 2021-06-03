class BeautyDataBeans {
  BeautyData data;
  Null otherData;
  String message;
  int statusCode;
  Null requestStatus;

  BeautyDataBeans(
      {this.data,
      this.otherData,
      this.message,
      this.statusCode,
      this.requestStatus});

  BeautyDataBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new BeautyData.fromJson(json['data']) : null;
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

class BeautyData {
  List<Beauty> beauty;
  List<RecentPhoto> recentPhoto;
  // List<Null> sponsor;
  List<String> sliders;
  //List<Null> sergeryEvent;
  // List<Null> sergeryBest;

  BeautyData({
    this.beauty,
    this.recentPhoto,
    // this.sponsor,
    this.sliders,
    // this.sergeryEvent,
    // this.sergeryBest
  });

  BeautyData.fromJson(Map<String, dynamic> json) {
    if (json['beauty'] != null) {
      beauty = new List<Beauty>();
      json['beauty'].forEach((v) {
        beauty.add(new Beauty.fromJson(v));
      });
    }
    if (json['recent_photo'] != null) {
      recentPhoto = new List<RecentPhoto>();
      json['recent_photo'].forEach((v) {
        recentPhoto.add(new RecentPhoto.fromJson(v));
      });
    }
    if (json['sliders'] != null) {
      sliders = json['sliders'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.beauty != null) {
      data['beauty'] = this.beauty.map((v) => v.toJson()).toList();
    }
    if (this.recentPhoto != null) {
      data['recent_photo'] = this.recentPhoto.map((v) => v.toJson()).toList();
    }

    data['sliders'] = this.sliders;

    return data;
  }
}

class Beauty {
  int id;
  int businessId;
  int subCategoryId;
  int followers;
  int workComplete;
  int portfolio;
  int review;
  int status;
  String thumbnail;
  String address;
  String city;
  String latitude;
  String longitude;
  int discountIntension;
  String activeName;
  String shopName;
  String specialtyOf;
  String createdAt;
  String updatedAt;
  String businessType;
  double distance;

  Beauty(
      {this.id,
      this.businessId,
      this.subCategoryId,
      this.followers,
      this.workComplete,
      this.portfolio,
      this.review,
      this.status,
      this.thumbnail,
      this.address,
      this.city,
      this.latitude,
      this.longitude,
      this.discountIntension,
      this.activeName,
      this.shopName,
      this.specialtyOf,
      this.createdAt,
      this.updatedAt,
      this.businessType,
      this.distance});

  Beauty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    subCategoryId = json['sub_category_id'];
    followers = json['followers'];
    workComplete = json['work_complete'];
    portfolio = json['portfolio'];
    review = json['review'];
    status = json['status'];
    thumbnail = json['thumbnail'];
    address = json['address'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    discountIntension = json['discount_intension'];
    activeName = json['active_name'];
    shopName = json['shop_name'];
    specialtyOf = json['specialty_of'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    businessType = json['business_type'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['sub_category_id'] = this.subCategoryId;
    data['followers'] = this.followers;
    data['work_complete'] = this.workComplete;
    data['portfolio'] = this.portfolio;
    data['review'] = this.review;
    data['status'] = this.status;
    data['thumbnail'] = this.thumbnail;
    data['address'] = this.address;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['discount_intension'] = this.discountIntension;
    data['active_name'] = this.activeName;
    data['shop_name'] = this.shopName;
    data['specialty_of'] = this.specialtyOf;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['business_type'] = this.businessType;
    data['distance'] = this.distance;
    return data;
  }
}

class RecentPhoto {
  int id;
  int subcategoryProfiledataId;
  String imageUrl;
  int view;
  String createdAt;
  String updatedAt;

  RecentPhoto(
      {this.id,
      this.subcategoryProfiledataId,
      this.imageUrl,
      this.view,
      this.createdAt,
      this.updatedAt});

  RecentPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryProfiledataId = json['subcategory_profiledata_id'];
    imageUrl = json['image_url'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcategory_profiledata_id'] = this.subcategoryProfiledataId;
    data['image_url'] = this.imageUrl;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
