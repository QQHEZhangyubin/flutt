// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record()
    ..uid = json['uid'] as num
    ..uimg = json['uimg'] as String
    ..uname = json['uname'] as String
    ..availablemoney = json['availablemoney'] as num
    ..pastdueaccount = json['pastdueaccount'] as num
    ..kejie = json['kejie'] as num
    ..nowread = json['nowread'] as List
    ..historyread = json['historyread'] as List;
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'uid': instance.uid,
      'uimg': instance.uimg,
      'uname': instance.uname,
      'availablemoney': instance.availablemoney,
      'pastdueaccount': instance.pastdueaccount,
      'kejie': instance.kejie,
      'nowread': instance.nowread,
      'historyread': instance.historyread
    };
