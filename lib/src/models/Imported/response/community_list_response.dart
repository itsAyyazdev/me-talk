import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/community_list_data.dart';
import '../base_response.dart';

part 'community_list_response.g.dart';


@JsonSerializable()
class CommunityListResponse  extends BaseResponse{

  List<CommunityListData> data;

  CommunityListResponse(this.data) : super('', 0);

  factory CommunityListResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityListResponseToJson(this);

}