import 'package:json_annotation/json_annotation.dart';

part 'citydata.g.dart';

@JsonSerializable()
class CityData{

  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "state_id")
  int stateId;


  CityData(this.name,this.id,this.stateId );


  factory CityData.fromJson(Map<String, dynamic> json) =>
      _$CityDataFromJson(json);

  Map<String, dynamic> toJson() => _$CityDataToJson(this);

}