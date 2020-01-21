import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
    Book();

    List booktype1;
    List booktype2;
    
    factory Book.fromJson(Map<String,dynamic> json) => _$BookFromJson(json);
    Map<String, dynamic> toJson() => _$BookToJson(this);
}
