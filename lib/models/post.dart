import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  int? id;
  int? userId;
  String? title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
