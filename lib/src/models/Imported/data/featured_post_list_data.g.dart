// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_post_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedPostData _$FeaturedPostDataFromJson(Map<String, dynamic> json) {
  return FeaturedPostData(
      json['id'] as int, json['event_id'] as int, json['image_url'] as String);
}

Map<String, dynamic> _$FeaturedPostDataToJson(FeaturedPostData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.eventId,
      'image_url': instance.imageUrl
    };
