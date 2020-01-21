// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentbook _$CommentbookFromJson(Map<String, dynamic> json) {
  return Commentbook()
    ..commentid = json['commentid'] as num
    ..commentuser = json['commentuser'] as String
    ..commentuserimg = json['commentuserimg'] as String
    ..commentcontent = json['commentcontent'] as String
    ..commentdate = json['commentdate'] as String
    ..favocomment = json['favocomment'] as num
    ..givestar = json['givestar'] as num;
}

Map<String, dynamic> _$CommentbookToJson(Commentbook instance) =>
    <String, dynamic>{
      'commentid': instance.commentid,
      'commentuser': instance.commentuser,
      'commentuserimg': instance.commentuserimg,
      'commentcontent': instance.commentcontent,
      'commentdate': instance.commentdate,
      'favocomment': instance.favocomment,
      'givestar': instance.givestar
    };
