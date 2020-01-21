// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book()
    ..booktype1 = json['booktype1'] as List
    ..booktype2 = json['booktype2'] as List;
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'booktype1': instance.booktype1,
      'booktype2': instance.booktype2
    };
