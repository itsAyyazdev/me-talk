import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/community_detail_data.dart';

import '../base_response.dart';

part 'community_detail_response.g.dart';

@JsonSerializable()
class CommunityDetailResponse extends BaseResponse{

  CommunityDetailData data;

  CommunityDetailResponse(String message, int statusCode, this.data)
      : super(message,statusCode);

  factory CommunityDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityDetailResponseToJson(this);

}

