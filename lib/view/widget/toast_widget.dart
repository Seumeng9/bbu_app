import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastFlutter(String msg, {Color textColor = Colors.white, Color bgColor = const Color.fromARGB(255, 107, 106, 106)}) {
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0
    );
}