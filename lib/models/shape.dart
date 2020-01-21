import 'package:json_annotation/json_annotation.dart';

part 'shape.g.dart';

@JsonSerializable()
class Shape {
    Shape();

    String name;
    Map<String,dynamic> property;
    
    factory Shape.fromJson(Map<String,dynamic> json) => _$ShapeFromJson(json);
    Map<String, dynamic> toJson() => _$ShapeToJson(this);
}
