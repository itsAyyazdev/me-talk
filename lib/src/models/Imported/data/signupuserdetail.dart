import 'package:json_annotation/json_annotation.dart';
part 'signupuserdetail.g.dart';

@JsonSerializable()
class SignUpUserDetail {

  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "status_id")
  int statusId;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "device_id")
  String deviceId;
  @JsonKey(name: "device_type")
  String deviceType;
  @JsonKey(name: "avatar")
  String avatar;

  SignUpUserDetail(
      {this.email,
        this.statusId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.name,
        this.deviceId,
        this.deviceType,
        this.avatar});

  factory SignUpUserDetail.fromJson(Map<String, dynamic> json) =>
      _$SignUpUserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpUserDetailToJson(this);

}