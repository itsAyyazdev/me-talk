
class SocialLoginRequest {
  int socialLoginTypeId;
  int socialId;
  String email;
  String name;
  String avatar;
  String deviceId;
  int deviceType;
  String deviceToken;
  int countryId;
  int cityId;

  SocialLoginRequest(
      {this.socialLoginTypeId,
        this.socialId,
        this.email,
        this.name,
        this.avatar,
        this.deviceId,
        this.deviceType,
        this.deviceToken,
        this.countryId,
        this.cityId});

  SocialLoginRequest.fromJson(Map<String, dynamic> json) {
    socialLoginTypeId = json['social_login_type_id'];
    socialId = json['social_id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    countryId = json['country_id'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['social_login_type_id'] = this.socialLoginTypeId;
    data['social_id'] = this.socialId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    return data;
  }
}
