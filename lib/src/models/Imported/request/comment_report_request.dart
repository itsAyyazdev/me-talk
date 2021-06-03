import 'package:json_annotation/json_annotation.dart';


part 'comment_report_request.g.dart';

@JsonSerializable()
class CommentReportRequest{

  @JsonKey(name: "review_comment_id")
  int reviewCommentId;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "reason")
  String reason;


  CommentReportRequest(this.reviewCommentId, this.roleId, this.reason);

  factory CommentReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentReportRequestToJson(this);

}