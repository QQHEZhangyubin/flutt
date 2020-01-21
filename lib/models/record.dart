import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

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
