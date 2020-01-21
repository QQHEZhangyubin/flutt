// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Read _$ReadFromJson(Map<String, dynamic> json) {
  return Read()
    ..bookid = json['bookid'] as num
    ..bookname = json['bookname'] as String
    ..bookimgurl = json['bookimgurl'] as String
    ..author = json['author'] as String
    ..endtime = json['endtime'] as String
    ..library = json['library'] as String
    ..iscomment = json['iscomment'] as String;
}

Map<String, dynamic> _$ReadToJson(Read instance) => <String, dynamic>{
      'bookid': instance.bookid,
      'bookname': instance.bookname,
      'bookimgurl': instance.bookimgurl,
      'author': instance.author,
      'endtime': instance.endtime,
      'library': instance.library,
      'iscomment': instance.iscomment
    };
