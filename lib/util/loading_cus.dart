import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingService {
  static final LoadingService _instance = LoadingService._internal();
  bool _isDialogShowing = false;

  factory LoadingService() {
    return _instance;
  }

  LoadingService._internal();

  void showLoading(BuildContext context) {
    if (!_isDialogShowing) {
      _isDialogShowing = true;


      Timer(Duration(milliseconds: 100), (){

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.teal,
                size: 50,
                secondRingColor: Colors.cyan,
                thirdRingColor: Colors.blue,
              ),
            ),
          );
        },
      ).then((_) {
        _isDialogShowing = false;  // Reset the flag when the dialog is dismissed
      });
      });
    }
  }

  void dismissLoading(BuildContext context) {
    if (_isDialogShowing) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShowing = false;
    }
  }
}
