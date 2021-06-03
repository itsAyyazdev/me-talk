import 'package:json_annotation/json_annotation.dart';

part 'report_post_request.g.dart';


@JsonSerializable()
class ReportPostRequest{

  @JsonKey(name: "review_id")
  int reviewId;
  @JsonKey(name: "review_type_id")
  int reviewTypeId;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "reason")
  String reason;

  ReportPostRequest(this.reviewId, this.reviewTypeId, this.roleId, this.reason);

  factory ReportPostRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPostRequestToJson(this);

}