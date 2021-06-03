import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/signupuserdetail.dart';

import '../base_response.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponse extends BaseResponse{

  SignUpUserDetail data;

  SignUpResponse(String message, int statusCode, this.data)
      : super(message,statusCode);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

}