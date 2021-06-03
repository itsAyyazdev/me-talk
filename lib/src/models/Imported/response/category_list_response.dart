import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/category_list_data.dart';

import '../base_response.dart';


part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse extends BaseResponse{

  List<CategoryListData> data;


  CategoryListResponse(this.data) : super('', 0);

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);

}