import 'package:e_learning_app/http/user_service.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/util/loading_cus.dart';
import 'package:e_learning_app/util/local_box.dart';
import 'package:e_learning_app/view/home_page.dart';
import 'package:e_learning_app/view/widget/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  bool? canPop;
  String? userName;
  LoginPage({super.key, this.canPop, this.userName});

  static const routeName = 'login_page';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.userName?.isNotEmpty ?? false) {
      userNameController.text = widget.userName ?? "";
    }

    print("token init state: ${Hive.box(Boxes.appConfigBox).get(BoxKey.token)}");

    userNameController.addListener(() {
      setState(() {
        
      });
    });
    passwordController.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xff009FC1),
      body: PopScope(
        canPop: widget.canPop ?? true,
        child: Center(
          
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('asset/images/login/icon.png',),
                ),
                SizedBox(height: 10,),
                
                TextField(
                  cursorColor: Colors.white,
                  controller: userNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    border: UnderlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add your forgot password logic here
                        toastFlutter("This feature will be available soon!");
                      },
                      child: Text('Forgot Password', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  
                  onPressed: ()async {
                    // Add your login logic here
                    if(userNameController.text.isEmpty || passwordController.text.isEmpty)return;
                    LoadingService().showLoading(context);
                    try{
                      var resp = await UserService().login(userNameController.text, passwordController.text);
                      if(resp.token?.isNotEmpty ?? false){
                        Hive.box(Boxes.appConfigBox).put(BoxKey.isLogin, true);
                      }

                      Hive.box(Boxes.appConfigBox).put(BoxKey.token, resp.token);
                      
                      LoadingService().dismissLoading(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainPage(),
                        fullscreenDialog: true,
                      ));
                    }catch(e) {
                      print("error");
                      
                      toastFlutter("Invalid Username or Password");
                    }finally {
                      LoadingService().dismissLoading(context);
                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: userNameController.text.isEmpty || passwordController.text.isEmpty ? Colors.white.withOpacity(0.7) : Colors.white,

                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}