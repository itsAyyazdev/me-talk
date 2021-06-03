import 'package:json_annotation/json_annotation.dart';

part 'userdata.g.dart';

@JsonSerializable()
class UserData{

  String token;
  User user;

  UserData({this.token, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}


@JsonSerializable()
class User {

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "status_id")
  int statusId;
  @JsonKey(name: "social_login_type_id")
  int socialLoginTypeId;
  @JsonKey(name: "social_id")
  String socialId;
  @JsonKey(name: "email_verified_at")
  String emailVerifiedAt;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "deleted_at")
  String deletedAt;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "roles")
  List<Roles> roles;

  User(
      {this.id,
        this.email,
        this.statusId,
        this.socialLoginTypeId,
        this.socialId,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.avatar,
        this.roles});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}

@JsonSerializable()
class Roles {

  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "name")
  String name;

  Roles({this.roleId, this.name});

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  Map<String, dynamic> toJson() => _$RolesToJson(this);

}