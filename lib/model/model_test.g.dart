// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelTest _$ModelTestFromJson(Map<String, dynamic> json) => ModelTest(
      notificationType: (json['notificationType'] as num?)?.toInt(),
      notificaitonId: json['notificaitonId'] as String?,
      userId: json['userId'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$ModelTestToJson(ModelTest instance) => <String, dynamic>{
      'notificationType': instance.notificationType,
      'userId': instance.userId,
      'notificaitonId': instance.notificaitonId,
      'userType': instance.userType,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };
