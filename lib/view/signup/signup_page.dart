import 'dart:ffi';

import 'package:e_learning_app/http/user_service.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/model/signup.dart';
import 'package:e_learning_app/util/loading_cus.dart';
import 'package:e_learning_app/view/login/view/login_page.dart';
import 'package:e_learning_app/view/widget/toast_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Create TextEditingController for each TextField
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();



  bool passwordHide = true;
  bool confirmPasswordHide = true;
  bool _confirmPasswordIsNotMatch = false;

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController.addListener(() {
      setState(() {
        
      });
    });
    userNameController.addListener(() {
      setState(() {
        
      });
    });
    emailController.addListener(() {
      setState(() {
        
      });
    });
    phoneNumberController.addListener(() {
      setState(() {
        
      });
    });
    passwordController.addListener(() {
      setState(() {
        
      });
    });
    confirmPasswordController.addListener(() {
      if(confirmPasswordController.text.isEmpty)
      {_confirmPasswordIsNotMatch = false;return;}
      if(confirmPasswordController.text != passwordController.text){
        _confirmPasswordIsNotMatch = true;
      }else {
        _confirmPasswordIsNotMatch = false;
      }
      setState(() {
      });
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff009FC1),
        title: Text(
          "SignUp",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff009FC1),
      body: PopScope(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 20,),
                TextField(
                  cursorColor: Colors.white,
                  controller: fullNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: userNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: phoneNumberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: passwordController,
                  obscureText: passwordHide,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passwordHide ? Icons.visibility : Icons.visibility_off), // Icon to toggle visibility
                      onPressed: () {
                        // Logic to toggle password visibility
                        setState(() {
                          passwordHide = !passwordHide;
                        });
                      },
                    ),
                  ),
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: confirmPasswordController,
                  obscureText: confirmPasswordHide,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    
                    errorText: _confirmPasswordIsNotMatch ? "Password do not match" : null,
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(confirmPasswordHide ? Icons.visibility : Icons.visibility_off), // Icon to toggle visibility
                      onPressed: () {
                        setState(() {
                          confirmPasswordHide = !confirmPasswordHide;
                        });
                        // Logic to toggle password visibility
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:
                  userNameController.text.isEmpty ||
                    fullNameController.text.isEmpty ||
                    phoneNumberController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty || _confirmPasswordIsNotMatch ? Colors.white.withOpacity(0.7):
                   Colors.white
                  ),
                  
                  onPressed:
                  
                   () async{
                    if(!enableButton())return;

                    LoadingService().showLoading(context);

                    try{
                      await UserService().signUp(
                        SingUp(
                          userName: userNameController.text,
                          name: fullNameController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          password: confirmPasswordController.text
                        )
                      );

                      // Add your signup logic here
                      LoadingService().dismissLoading(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                        fullscreenDialog: true,
                      ));

                    }catch(e) {
                      toastFlutter("Something went wrong");
                      print("Error SignUp");
                    }finally{
                      LoadingService().dismissLoading(context);
                    }

                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text('Sign Up', style: TextStyle(color: enableButton() ? Colors.black : Colors.white),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool enableButton() {
    return !(userNameController.text.isEmpty ||
                    fullNameController.text.isEmpty ||
                    phoneNumberController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty || _confirmPasswordIsNotMatch);
  }

}
