// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doveModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dove _$DoveFromJson(Map<String, dynamic> json) {
  return Dove(json['name'] as String, json['description'] as String,
      json['imagePath'] as String);
}

Map<String, dynamic> _$DoveToJson(Dove instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath
    };
