// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookdetail _$BookdetailFromJson(Map<String, dynamic> json) {
  return Bookdetail()
    ..bookid = json['bookid'] as num
    ..booktype = json['booktype'] as num
    ..bookname = json['bookname'] as String
    ..bookimgurl = json['bookimgurl'] as String
    ..author = json['author'] as String
    ..dec = json['dec'] as String
    ..favoritecount = json['favoritecount'] as num
    ..press = json['press'] as String
    ..pressdate = json['pressdate'] as String
    ..chaptercount = json['chaptercount'] as num
    ..guancang = json['guancang'] as List
    ..boocomment = json['boocomment'] as List;
}

Map<String, dynamic> _$BookdetailToJson(Bookdetail instance) =>
    <String, dynamic>{
      'bookid': instance.bookid,
      'booktype': instance.booktype,
      'bookname': instance.bookname,
      'bookimgurl': instance.bookimgurl,
      'author': instance.author,
      'dec': instance.dec,
      'favoritecount': instance.favoritecount,
      'press': instance.press,
      'pressdate': instance.pressdate,
      'chaptercount': instance.chaptercount,
      'guancang': instance.guancang,
      'boocomment': instance.boocomment
    };
