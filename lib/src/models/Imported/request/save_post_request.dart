import 'package:json_annotation/json_annotation.dart';

part 'save_post_request.g.dart';

@JsonSerializable()
class SavePostRequest{

  @JsonKey(name: "history_id")
  int historyId;
  @JsonKey(name: "history_type_id")
  int historyTypeId;
  @JsonKey(name: "role_id")
  int roleId;

  SavePostRequest(this.historyId, this.historyTypeId, this.roleId);

  factory SavePostRequest.fromJson(Map<String, dynamic> json) =>
      _$SavePostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SavePostRequestToJson(this);

}