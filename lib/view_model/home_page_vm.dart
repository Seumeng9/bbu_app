import 'package:e_learning_app/http/course_service.dart';
import 'package:e_learning_app/model/course.dart';
import 'package:flutter/material.dart';

class HomePageVM with ChangeNotifier {

  CourseList? courses;


  Future<void> getCourses() async{
    courses = await CourseService().getCourses("/1");
    notifyListeners();
  }
  
}