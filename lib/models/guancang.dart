import 'package:json_annotation/json_annotation.dart';

part 'guancang.g.dart';

@JsonSerializable()
class Guancang {
    Guancang();

    String suozaiguan;
    String state;
    String guancangdian;
    String suoshuhao;
    
    factory Guancang.fromJson(Map<String,dynamic> json) => _$GuancangFromJson(json);
    Map<String, dynamic> toJson() => _$GuancangToJson(this);
}
