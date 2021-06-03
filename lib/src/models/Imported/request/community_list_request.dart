import 'package:json_annotation/json_annotation.dart';

part 'community_list_request.g.dart';

@JsonSerializable()
class CommunityListRequest {

  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "category_id")
  int categoryId;
  @JsonKey(name: "sub_category_id")
  int subCategoryId;
  @JsonKey(name: "order_by")
  int orderBy;
  @JsonKey(name: "page_no")
  int pageNo;

  CommunityListRequest(this.roleId, this.categoryId, this.subCategoryId,this.orderBy,this.pageNo);

  factory CommunityListRequest.fromJson(Map<String, dynamic> json) =>
      _$CommunityListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityListRequestToJson(this);

}