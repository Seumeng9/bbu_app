import 'package:json_annotation/json_annotation.dart';

part 'model_test.g.dart';

@JsonSerializable()
class ModelTest extends Object {
  // @JsonKey(name: 'transferFlg')

  int? notificationType;

  // @JsonKey(name: 'payPassword')

  String? userId;

  // @JsonKey(name: 'bioPayCode')

  String? notificaitonId;

  // @JsonKey(name: 'verificationCode')

  String? userType;

  ModelTest({
    this.notificationType,
    this.notificaitonId,
    this.userId,
    this.userType,
  });

  factory ModelTest.fromJson(Map<String, dynamic> srcJson) =>
      _$ModelTestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelTestToJson(this);
}

@JsonSerializable()
class UserData extends Object {
  String? title;
  String? body;
  String? userId;


  UserData({
    this.title,
    this.body,
    this.userId,
  });

  factory UserData.fromJson(Map<String, dynamic> srcJson) =>
      _$UserDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}