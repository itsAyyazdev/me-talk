import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/userdata.dart';

import '../base_response.dart';

part 'login_responce.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse{

  UserData data;

  LoginResponse(String message, int statusCode, this.data)
      : super(message,statusCode);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}