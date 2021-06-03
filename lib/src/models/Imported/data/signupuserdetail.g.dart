// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupuserdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpUserDetail _$SignUpUserDetailFromJson(Map<String, dynamic> json) {
  return SignUpUserDetail(
      email: json['email'] as String,
      statusId: json['status_id'] as int,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      deviceId: json['device_id'] as String,
      deviceType: json['device_type'] as String,
      avatar: json['avatar'] as String);
}

Map<String, dynamic> _$SignUpUserDetailToJson(SignUpUserDetail instance) =>
    <String, dynamic>{
      'email': instance.email,
      'status_id': instance.statusId,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'name': instance.name,
      'device_id': instance.deviceId,
      'device_type': instance.deviceType,
      'avatar': instance.avatar
    };
