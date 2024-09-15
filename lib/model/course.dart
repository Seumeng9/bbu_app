import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CourseItem extends Object {
  // @JsonKey(name: 'username')

  @HiveField(0)
  int? id;
  @HiveField(9)
  String? title;
  @HiveField(1)
  double? price;
  @HiveField(2)
  int? createBy;
  @HiveField(3)
  String? courseInclude;
  @HiveField(4)
  String? courseLearning;
  @HiveField(5)
  int? status;
  @HiveField(6)
  int? categoryId;
  @HiveField(7)
  String? createdAt;
  @HiveField(8)
  String? updatedAt;
  @HiveField(10)
  CategoryItem? category;
  @HiveField(11)
  List<CourseTagItem>? courseTags;


  CourseItem({
    this.title
    ,this.id
    ,this.categoryId,
    this.courseInclude,
    this.courseLearning,
    this.createBy,
    this.createdAt,
    this.price,
    this.status,
    this.updatedAt,
    this.category,
    // this.courseTags,
  });

  factory CourseItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseItemToJson(this);
}





@HiveType(typeId: 1)
@JsonSerializable()
class CourseList extends Object {
  // @JsonKey(name: 'username')

  @JsonKey(name: 'data')
  @HiveField(0)
  List<CourseItem>? courseList;

  CourseList({
    this.courseList
  });

  factory CourseList.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseListToJson(this);
}


@HiveType(typeId: 3)
@JsonSerializable()
class CategoryItem extends Object {

  @JsonKey(name: 'category')
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  int? parentId;

  CategoryItem({
    this.id,
    this.name,
    this.parentId,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}



@HiveType(typeId: 4)
@JsonSerializable()
class CourseTagItem extends Object {

  // @JsonKey(name: 'category')
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? courseId;

  @HiveField(2)
  String? title;

  CourseTagItem({
    this.id,
    this.courseId,
    this.title,
  });

  factory CourseTagItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseTagItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseTagItemToJson(this);
}
