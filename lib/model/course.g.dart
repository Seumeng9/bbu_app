// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseItemAdapter extends TypeAdapter<CourseItem> {
  @override
  final int typeId = 0;

  @override
  CourseItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseItem(
      title: fields[9] as String?,
      id: fields[0] as int?,
      categoryId: fields[6] as int?,
      courseInclude: fields[3] as String?,
      courseLearning: fields[4] as String?,
      createBy: fields[2] as int?,
      createdAt: fields[7] as String?,
      price: fields[1] as double?,
      status: fields[5] as int?,
      updatedAt: fields[8] as String?,
      category: fields[10] as CategoryItem?,
    )..courseTags = (fields[11] as List?)?.cast<CourseTagItem>();
  }

  @override
  void write(BinaryWriter writer, CourseItem obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.createBy)
      ..writeByte(3)
      ..write(obj.courseInclude)
      ..writeByte(4)
      ..write(obj.courseLearning)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.categoryId)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.courseTags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseListAdapter extends TypeAdapter<CourseList> {
  @override
  final int typeId = 1;

  @override
  CourseList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseList(
      courseList: (fields[0] as List?)?.cast<CourseItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.courseList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryItemAdapter extends TypeAdapter<CategoryItem> {
  @override
  final int typeId = 3;

  @override
  CategoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryItem(
      id: fields[0] as int?,
      name: fields[1] as String?,
      parentId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.parentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseTagItemAdapter extends TypeAdapter<CourseTagItem> {
  @override
  final int typeId = 4;

  @override
  CourseTagItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseTagItem(
      id: fields[0] as int?,
      courseId: fields[1] as int?,
      title: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CourseTagItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseId)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseTagItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseItem _$CourseItemFromJson(Map<String, dynamic> json) => CourseItem(
      title: json['title'] as String?,
      id: (json['id'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      courseInclude: json['courseInclude'] as String?,
      courseLearning: json['courseLearning'] as String?,
      createBy: (json['createBy'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
      updatedAt: json['updatedAt'] as String?,
      category: json['category'] == null
          ? null
          : CategoryItem.fromJson(json['category'] as Map<String, dynamic>),
    )..courseTags = (json['courseTags'] as List<dynamic>?)
        ?.map((e) => CourseTagItem.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$CourseItemToJson(CourseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'createBy': instance.createBy,
      'courseInclude': instance.courseInclude,
      'courseLearning': instance.courseLearning,
      'status': instance.status,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
      'courseTags': instance.courseTags,
    };

CourseList _$CourseListFromJson(Map<String, dynamic> json) => CourseList(
      courseList: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseListToJson(CourseList instance) =>
    <String, dynamic>{
      'data': instance.courseList,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      id: (json['category'] as num?)?.toInt(),
      name: json['name'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'category': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
    };

CourseTagItem _$CourseTagItemFromJson(Map<String, dynamic> json) =>
    CourseTagItem(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['courseId'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseTagItemToJson(CourseTagItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'title': instance.title,
    };
