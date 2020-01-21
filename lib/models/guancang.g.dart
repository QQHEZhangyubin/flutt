// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guancang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guancang _$GuancangFromJson(Map<String, dynamic> json) {
  return Guancang()
    ..suozaiguan = json['suozaiguan'] as String
    ..state = json['state'] as String
    ..guancangdian = json['guancangdian'] as String
    ..suoshuhao = json['suoshuhao'] as String;
}

Map<String, dynamic> _$GuancangToJson(Guancang instance) => <String, dynamic>{
      'suozaiguan': instance.suozaiguan,
      'state': instance.state,
      'guancangdian': instance.guancangdian,
      'suoshuhao': instance.suoshuhao
    };
