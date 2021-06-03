// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      json['message'] as String,
      json['status_code'] as int,
      json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data
    };
