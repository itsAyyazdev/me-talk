

class CheckSocialUserRequest {
  int socialLoginTypeId;
  int socialId;

  CheckSocialUserRequest({this.socialLoginTypeId, this.socialId});

  CheckSocialUserRequest.fromJson(Map<String, dynamic> json) {
    socialLoginTypeId = json['social_login_type_id'];
    socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['social_login_type_id'] = this.socialLoginTypeId;
    data['social_id'] = this.socialId;
    return data;
  }
}
