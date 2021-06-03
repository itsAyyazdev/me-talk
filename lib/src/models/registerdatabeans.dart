class RegisterDataBeans {
  RegisterData data;
  Null otherData;
  String message;
  int statusCode;

  RegisterDataBeans({this.data, this.otherData, this.message, this.statusCode});

  RegisterDataBeans.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new RegisterData.fromJson(json['data']) : null;
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

class RegisterData {
  String email;
  int statusId;
  String updatedAt;
  String createdAt;
  int id;
  String name;
  String deviceId;
  String deviceType;
  int phoneCode;
  int phoneNumber;
  Null language;
  Null gender;
  Null recommendedCode;
  int refferedBy;
  String avatar;
  String token;
  List<Roles> roles;

  RegisterData(
      {this.email,
      this.statusId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.name,
      this.deviceId,
      this.deviceType,
      this.phoneCode,
      this.phoneNumber,
      this.language,
      this.gender,
      this.recommendedCode,
      this.refferedBy,
      this.avatar,
      this.token,
      this.roles});

  RegisterData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    statusId = json['status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    name = json['name'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    phoneCode = json['phone_code'];
    phoneNumber = json['phone_number'];
    language = json['language'];
    gender = json['gender'];
    recommendedCode = json['recommended_code'];
    refferedBy = json['reffered_by'];
    avatar = json['avatar'];
    token = json['token'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['status_id'] = this.statusId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['phone_code'] = this.phoneCode;
    data['phone_number'] = this.phoneNumber;
    data['language'] = this.language;
    data['gender'] = this.gender;
    data['recommended_code'] = this.recommendedCode;
    data['reffered_by'] = this.refferedBy;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Roles {
  int roleId;
  String name;

  Roles({this.roleId, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    return data;
  }
}
