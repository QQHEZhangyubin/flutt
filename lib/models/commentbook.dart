import 'package:json_annotation/json_annotation.dart';

part 'commentbook.g.dart';

@JsonSerializable()
class Commentbook {
    Commentbook();

    num commentid;
    String commentuser;
    String commentuserimg;
    String commentcontent;
    String commentdate;
    num favocomment;
    num givestar;
    
    factory Commentbook.fromJson(Map<String,dynamic> json) => _$CommentbookFromJson(json);
    Map<String, dynamic> toJson() => _$CommentbookToJson(this);
}
