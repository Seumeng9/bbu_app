// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingUp _$SingUpFromJson(Map<String, dynamic> json) => SingUp(
      userName: json['username'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SingUpToJson(SingUp instance) => <String, dynamic>{
      'username': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
    };
