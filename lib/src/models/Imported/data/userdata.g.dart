// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
      token: json['token'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserDataToJson(UserData instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as int,
      email: json['email'] as String,
      statusId: json['status_id'] as int,
      socialLoginTypeId: json['social_login_type_id'] as int,
      socialId: json['social_id'] as String,
      emailVerifiedAt: json['email_verified_at'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      deletedAt: json['deleted_at'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      roles: (json['roles'] as List)
          ?.map((e) =>
              e == null ? null : Roles.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'status_id': instance.statusId,
      'social_login_type_id': instance.socialLoginTypeId,
      'social_id': instance.socialId,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'roles': instance.roles
    };

Roles _$RolesFromJson(Map<String, dynamic> json) {
  return Roles(roleId: json['role_id'] as int, name: json['name'] as String);
}

Map<String, dynamic> _$RolesToJson(Roles instance) =>
    <String, dynamic>{'role_id': instance.roleId, 'name': instance.name};
