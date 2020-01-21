import 'package:json_annotation/json_annotation.dart';

part 'bookdata.g.dart';

@JsonSerializable()
class Bookdata {
    Bookdata();

    num bookid;
    num booktype;
    String bookname;
    String bookimgurl;
    String author;
    String dec;
    String press;
    String pressdate;
    String library;
    String suoshuhao;
    
    factory Bookdata.fromJson(Map<String,dynamic> json) => _$BookdataFromJson(json);
    Map<String, dynamic> toJson() => _$BookdataToJson(this);
}

class BookdataList{
    List<Bookdata> bookdataList;
    BookdataList({this.bookdataList});

    factory BookdataList.fromJson(List<dynamic> listjson){
       List<Bookdata> bookdatalis = listjson.map((value) => Bookdata.fromJson(value)).toList();
        return BookdataList(bookdataList: bookdatalis);
    }
}
