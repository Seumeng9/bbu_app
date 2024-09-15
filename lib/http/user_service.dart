import 'package:e_learning_app/http/service_http.dart';
import 'package:e_learning_app/model/login.dart';
import 'package:e_learning_app/model/signup.dart';

class UserService {
  Future<void> signUp(SingUp req) async {
    // req.role = ['ROLE_USER'];
    
    await ServiceHttp().request(uri: "/api/auth/signup", body: req);
  }
  
  Future<Login> login(String username, String pass) async{

    var resp = await ServiceHttp().request(uri: "/api/auth/login", body: {
      'username': username,
      'password': pass,
    });

    return Login.fromJson(resp);

  }

}