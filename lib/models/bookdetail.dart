import 'package:json_annotation/json_annotation.dart';

part 'bookdetail.g.dart';
/*
   图书详情页面对应的数据模型，其中包含书对应的馆藏信息（guancang.dart）和用户对这本书的评论(commentbook.dart)
 */
@JsonSerializable()
class Bookdetail {
    Bookdetail();

    num bookid;
    num booktype;
    String bookname;
    String bookimgurl;
    String author;
    String dec;
    num favoritecount;
    String press;
    String pressdate;
    num chaptercount;
    List guancang;
    List boocomment;
    
    factory Bookdetail.fromJson(Map<String,dynamic> json) => _$BookdetailFromJson(json);
    Map<String, dynamic> toJson() => _$BookdetailToJson(this);
}
