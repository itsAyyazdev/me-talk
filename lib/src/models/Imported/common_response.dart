

import 'package:json_annotation/json_annotation.dart';
part 'common_response.g.dart';
@JsonSerializable()
class CommonResponse {
  @JsonKey(name: 'status_code')
  int statusCode ;
  @JsonKey(nullable: false)
  String message = '';
  @JsonKey(name: 'data')
  dynamic data ;
  @JsonKey(name: 'other_data')
  dynamic otherData ;

  CommonResponse( this.message,this.statusCode,this.data,this.otherData);

  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}
