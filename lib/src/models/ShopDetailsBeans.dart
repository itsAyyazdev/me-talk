class ShopDetailsBeans {
  ShopDetailsBeansData data;
  Null otherData;
  String message;
  int statusCode;
  Null requestStatus;

  ShopDetailsBeans(
      {this.data,
      this.otherData,
      this.message,
      this.statusCode,
      this.requestStatus});

  ShopDetailsBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ShopDetailsBeansData.fromJson(json['data'])
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

class ShopDetailsBeansData {
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
  String profilePic;
  int follow;
  List<Gallary> gallary;
  List<Slider> slider;

  ShopDetailsBeansData(
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
      this.profilePic,
      this.follow,
      this.gallary,
      this.slider});

  ShopDetailsBeansData.fromJson(Map<String, dynamic> json) {
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
    profilePic = json['profile_pic'];
    follow = json['follow'];
    if (json['gallary'] != null) {
      gallary = new List<Gallary>();
      json['gallary'].forEach((v) {
        gallary.add(new Gallary.fromJson(v));
      });
    }
    if (json['slider'] != null) {
      slider = new List<Slider>();
      json['slider'].forEach((v) {
        slider.add(new Slider.fromJson(v));
      });
    }
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
    data['profile_pic'] = this.profilePic;
    data['follow'] = this.follow;
    if (this.gallary != null) {
      data['gallary'] = this.gallary.map((v) => v.toJson()).toList();
    }
    if (this.slider != null) {
      data['slider'] = this.slider.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gallary {
  int subcategoryGallaryId;
  String imageUrl;
  String gallaryCreated;

  Gallary({this.subcategoryGallaryId, this.imageUrl, this.gallaryCreated});

  Gallary.fromJson(Map<String, dynamic> json) {
    subcategoryGallaryId = json['subcategory_gallary_id'];
    imageUrl = json['image_url'];
    gallaryCreated = json['gallary_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategory_gallary_id'] = this.subcategoryGallaryId;
    data['image_url'] = this.imageUrl;
    data['gallary_created'] = this.gallaryCreated;
    return data;
  }
}

class Slider {
  int id;
  String imageUrl;
  int subcategoryProfileId;
  String createdAt;
  String updatedAt;

  Slider(
      {this.id,
      this.imageUrl,
      this.subcategoryProfileId,
      this.createdAt,
      this.updatedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    subcategoryProfileId = json['subcategory_profile_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['subcategory_profile_id'] = this.subcategoryProfileId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
