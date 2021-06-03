import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/reply_list_data.dart';
import '../base_response.dart';

part 'reply_list_response.g.dart';

@JsonSerializable()
class ReplyListResponse extends BaseResponse{

  List<ReplyListData>  data;

  ReplyListResponse(String message, int statusCode, this.data)
      : super(message,statusCode);

  factory ReplyListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReplyListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyListResponseToJson(this);

}