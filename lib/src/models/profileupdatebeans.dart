class ProfileUpdateBeans {
  ProfileUpdateData data;
  Null otherData;
  String message;
  int statusCode;

  ProfileUpdateBeans(
      {this.data, this.otherData, this.message, this.statusCode});

  ProfileUpdateBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ProfileUpdateData.fromJson(json['data'])
        : null;
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

class ProfileUpdateData {
  String name;
  String avatar;
  int gender;
  int language;
  int phoneCode;
  int phoneNumber;

  ProfileUpdateData(
      {this.name,
      this.avatar,
      this.gender,
      this.language,
      this.phoneCode,
      this.phoneNumber});

  ProfileUpdateData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    gender = json['gender'];
    language = json['language'];
    phoneCode = json['phone_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['language'] = this.language;
    data['phone_code'] = this.phoneCode;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class ProfileData {
  String name;
  String avatar;
  String gender;
  int phoneCode;
  int phoneNumber;

  ProfileData({
    this.name,
    this.avatar,
    this.gender,
    this.phoneCode,
    this.phoneNumber,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneCode = json['phone_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['phone_code'] = this.phoneCode;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
