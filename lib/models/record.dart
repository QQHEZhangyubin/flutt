import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

/*
主页第四个页面对应的数据模型，其中包括正在借阅的图书数据模型（read.dart）和曾经阅读过的数据模型（同一个模型）
 */
@JsonSerializable()
class Record {
    Record();

    num uid;
    String uimg;
    String uname;
    num availablemoney;
    num pastdueaccount;
    num kejie;
    List nowread;
    List historyread;
    
    factory Record.fromJson(Map<String,dynamic> json) => _$RecordFromJson(json);
    Map<String, dynamic> toJson() => _$RecordToJson(this);
}
