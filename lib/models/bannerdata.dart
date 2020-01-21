import 'package:json_annotation/json_annotation.dart';

part 'bannerdata.g.dart';

@JsonSerializable()
class Bannerdata {
    Bannerdata();

    String imgurl;
    String clickurl;
    
    factory Bannerdata.fromJson(Map<String,dynamic> json) => _$BannerdataFromJson(json);
    Map<String, dynamic> toJson() => _$BannerdataToJson(this);
}
