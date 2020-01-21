// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape()
    ..name = json['name'] as String
    ..property = json['property'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ShapeToJson(Shape instance) =>
    <String, dynamic>{'name': instance.name, 'property': instance.property};
