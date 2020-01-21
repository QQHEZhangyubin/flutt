import 'package:json_annotation/json_annotation.dart';

part 'read.g.dart';

@JsonSerializable()
class Read {
    Read();

    num bookid;
    String bookname;
    String bookimgurl;
    String author;
    String endtime;
    String library;
    String iscomment;
    
    factory Read.fromJson(Map<String,dynamic> json) => _$ReadFromJson(json);
    Map<String, dynamic> toJson() => _$ReadToJson(this);
}
