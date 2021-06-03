
import 'package:json_annotation/json_annotation.dart';
import 'package:me_talk/src/models/Imported/data/featured_post_list_data.dart';
import '../base_response.dart';
part 'featured_post_list_response.g.dart';

@JsonSerializable()
class FeaturedPostResponse extends BaseResponse{


  List<FeaturedPostData> data;

  FeaturedPostResponse(int statusCode,String message,this.data) : super(message,statusCode);

  factory FeaturedPostResponse.fromJson(Map<String, dynamic> json) =>
      _$FeaturedPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedPostResponseToJson(this);

}