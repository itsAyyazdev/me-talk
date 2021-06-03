

import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status_code')
  int statusCode ;
  @JsonKey(nullable: false)
  String message = '';
//  @JsonKey(name: 'data')
//  dynamic data ;

  BaseResponse( this.message,this.statusCode);

 factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
