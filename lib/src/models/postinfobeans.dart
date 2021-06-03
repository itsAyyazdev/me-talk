class PostInfoBeans {
  PostInfoBeansData data;
  Null otherData;
  String message;
  int statusCode;
  Null requestStatus;

  PostInfoBeans(
      {this.data,
      this.otherData,
      this.message,
      this.statusCode,
      this.requestStatus});

  PostInfoBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new PostInfoBeansData.fromJson(json['data'])
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

class PostInfoBeansData {
  int subcategoryGallaryId;
  String imageUrl;
  String gallaryCreated;
  String activeName;
  String shopName;
  String address;
  String city;
  String latitude;
  String longitude;
  String thumbnail;
  String specialtyOf;
  int view;
  int discount;

  PostInfoBeansData(
      {this.subcategoryGallaryId,
      this.imageUrl,
      this.gallaryCreated,
      this.activeName,
      this.shopName,
      this.address,
      this.city,
      this.latitude,
      this.longitude,
      this.thumbnail,
      this.specialtyOf,
      this.view,
      this.discount});

  PostInfoBeansData.fromJson(Map<String, dynamic> json) {
    subcategoryGallaryId = json['subcategory_gallary_id'];
    imageUrl = json['image_url'];
    gallaryCreated = json['gallary_created'];
    activeName = json['active_name'];
    shopName = json['shop_name'];
    address = json['address'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    thumbnail = json['thumbnail'];
    specialtyOf = json['specialty_of'];
    view = json['view'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategory_gallary_id'] = this.subcategoryGallaryId;
    data['image_url'] = this.imageUrl;
    data['gallary_created'] = this.gallaryCreated;
    data['active_name'] = this.activeName;
    data['shop_name'] = this.shopName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['thumbnail'] = this.thumbnail;
    data['specialty_of'] = this.specialtyOf;
    data['view'] = this.view;
    data['discount'] = this.discount;
    return data;
  }
}
