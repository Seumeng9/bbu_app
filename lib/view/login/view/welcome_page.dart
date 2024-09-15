import 'dart:io';

import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/home_page.dart';
import 'package:e_learning_app/view/login/view/login_page.dart';
import 'package:e_learning_app/view/signup/signup_page.dart';
import 'package:e_learning_app/view/widget/toast_widget.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {

     DateTime? lastPressed;


    return Scaffold(
      backgroundColor: Color(0xff009FC1),
      body: PopScope(
        canPop: false, //!blurModel.isShowCustomContent,
        onPopInvoked: (bool didPop) {

        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();
          toastFlutter("Click again to exit the application", textColor: Colors.white, bgColor: const Color.fromARGB(255, 107, 106, 106));
          return; // Don't exit the app
        }

        Future.delayed(Duration.zero, () {
          exit(0);
        });
          
        },
        child: Center(
          
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('asset/images/login/icon.png',),
                ),
                SizedBox(height: 30,),
              
                ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: false));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.black),),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text('Sigup', style: TextStyle(color: Colors.black),),
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    Text("I’ll do it later,", style: TextStyle(color: Colors.white),),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage(), fullscreenDialog: true));
                      },
                      child: Text('Skip now ', style: TextStyle(color: Color(0xff003ACE)),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}