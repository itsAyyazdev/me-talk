class LoginDataBeans {
  LoginData data;
  String message;
  int statusCode;

  LoginDataBeans({this.data, this.message, this.statusCode});

  LoginDataBeans.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class LoginData {
  String token;
  User user;

  LoginData({this.token, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String username;
  String phone;
  String email;
  String emailVerifiedAt;
  int deviceTypeId;
  String deviceId;
  int isActive;
  String lastLogin;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String deviceTypeName;
  String avatar;
  String phoneCode;
  String gender;
  List<EntityType> entityType;

  User(
      {this.id,
      this.username,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.deviceTypeId,
      this.deviceId,
      this.isActive,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.deviceTypeName,
      this.avatar,
      this.phoneCode,
      this.gender,
      this.entityType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    deviceTypeId = json['device_type_id'];
    deviceId = json['device_id'];
    isActive = json['is_active'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deviceTypeName = json['device_type_name'];
    avatar = json['avatar_url'];
    phoneCode = json['phone_code'];
    gender = json['gender'];
    if (json['entity_type'] != null) {
      entityType = new List<EntityType>();
      json['entity_type'].forEach((v) {
        entityType.add(new EntityType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['device_type_id'] = this.deviceTypeId;
    data['device_id'] = this.deviceId;
    data['is_active'] = this.isActive;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['device_type_name'] = this.deviceTypeName;
    data['avatar'] = this.avatar;
    data['phone_code'] = this.phoneCode;
    data['gender'] = this.gender;
    if (this.entityType != null) {
      data['entity_type'] = this.entityType.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EntityType {
  int id;
  int userId;
  int entityTypeId;
  int entityId;
  String createdAt;
  String updatedAt;
  String entityTypeName;
  EntityData entityData;

  EntityType(
      {this.id,
      this.userId,
      this.entityTypeId,
      this.entityId,
      this.createdAt,
      this.updatedAt,
      this.entityTypeName,
      this.entityData});

  EntityType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    entityTypeId = json['entity_type_id'];
    entityId = json['entity_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    entityTypeName = json['entity_type_name'];
    entityData = json['entity_data'] != null
        ? new EntityData.fromJson(json['entity_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['entity_type_id'] = this.entityTypeId;
    data['entity_id'] = this.entityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['entity_type_name'] = this.entityTypeName;
    if (this.entityData != null) {
      data['entity_data'] = this.entityData.toJson();
    }
    return data;
  }
}

class EntityData {
  int id;
  int countryId;
  String displayName;
  String recommendCode;
  String firstName;
  String lastName;
  String avatar;
  String email;
  String mobile;
  String gender;
  String birthday;
  int statusId;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String statusName;

  EntityData(
      {this.id,
      this.countryId,
      this.displayName,
      this.recommendCode,
      this.firstName,
      this.lastName,
      this.avatar,
      this.email,
      this.mobile,
      this.gender,
      this.birthday,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.statusName});

  EntityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    displayName = json['display_name'];
    recommendCode = json['recommend_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    birthday = json['birthday'];
    statusId = json['status_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['display_name'] = this.displayName;
    data['recommend_code'] = this.recommendCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['status_name'] = this.statusName;
    return data;
  }
}
