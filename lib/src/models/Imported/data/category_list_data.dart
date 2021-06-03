import 'package:json_annotation/json_annotation.dart';

part 'category_list_data.g.dart';

@JsonSerializable()
class CategoryListData{

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  CategoryListData(this.id, this.name);

  factory CategoryListData.fromJson(Map<String, dynamic> json) =>
      _$CategoryListDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListDataToJson(this);

}