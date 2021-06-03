import 'package:json_annotation/json_annotation.dart';

part 'reply_list_data.g.dart';

@JsonSerializable()
class ReplyListData{

  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "reply")
  String reply;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "time_difference")
  String timeDifference;

  ReplyListData(this.name, this.avatar, this.id, this.reply, this.createdAt,
      this.timeDifference);


  factory ReplyListData.fromJson(Map<String, dynamic> json) =>
      _$ReplyListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyListDataToJson(this);

}