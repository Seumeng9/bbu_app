import 'package:json_annotation/json_annotation.dart';

part 'signup.g.dart';

@JsonSerializable()
class SingUp extends Object {//signup req
  @JsonKey(name: 'username')
  String? userName;

  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  SingUp({
    this.userName,
    this.name,
    this.password,
    this.phoneNumber,
    this.email
  });

  factory SingUp.fromJson(Map<String, dynamic> srcJson) =>
      _$SingUpFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingUpToJson(this);
}

// @JsonSerializable()
// class UserData extends Object {
//   String? title;
//   String? body;
//   String? userId;


//   UserData({
//     this.title,
//     this.body,
//     this.userId,
//   });

//   factory UserData.fromJson(Map<String, dynamic> srcJson) =>
//       _$UserDataFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$UserDataToJson(this);
// }