// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Apod _$$_ApodFromJson(Map<String, dynamic> json) => _$_Apod(
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      imageUrl: json['url'] as String,
    );

Map<String, dynamic> _$$_ApodToJson(_$_Apod instance) => <String, dynamic>{
      'title': instance.title,
      'explanation': instance.explanation,
      'url': instance.imageUrl,
    };
