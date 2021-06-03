import 'package:json_annotation/json_annotation.dart';


part 'category_list_request.g.dart';

@JsonSerializable()
class CategoryList {

  @JsonKey(name: "category_id")
  String categoryId;

  CategoryList(this.categoryId);

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);

}