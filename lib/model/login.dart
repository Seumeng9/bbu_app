import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login extends Object {//signup req
  // @JsonKey(name: 'username')
  String? token;

  int? expiresIn;

  Login({
    this.token
    ,this.expiresIn
  });

  factory Login.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
