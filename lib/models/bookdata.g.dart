// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookdata _$BookdataFromJson(Map<String, dynamic> json) {
  return Bookdata()
    ..bookid = json['bookid'] as num
    ..booktype = json['booktype'] as num
    ..bookname = json['bookname'] as String
    ..bookimgurl = json['bookimgurl'] as String
    ..author = json['author'] as String
    ..dec = json['dec'] as String
    ..press = json['press'] as String
    ..pressdate = json['pressdate'] as String
    ..library = json['library'] as String
    ..suoshuhao = json['suoshuhao'] as String;
}

Map<String, dynamic> _$BookdataToJson(Bookdata instance) => <String, dynamic>{
      'bookid': instance.bookid,
      'booktype': instance.booktype,
      'bookname': instance.bookname,
      'bookimgurl': instance.bookimgurl,
      'author': instance.author,
      'dec': instance.dec,
      'press': instance.press,
      'pressdate': instance.pressdate,
      'library': instance.library,
      'suoshuhao': instance.suoshuhao
    };
