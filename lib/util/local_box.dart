import 'package:e_learning_app/model/course.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static const appConfigBox = 'appConfigBox';


  static openBoxes() async {
    await Hive.openBox(appConfigBox);
  }

  static registerBox() async {
    Hive.registerAdapter(CourseListAdapter());
    Hive.registerAdapter(CourseItemAdapter());
    Hive.registerAdapter(CategoryItemAdapter());
    Hive.registerAdapter(CourseTagItemAdapter());
  }

  static closeBoxes() async {
    await Hive.close();
  }
}

class BoxKey{
  static const token = "userToken";
  static const isLogin = "isUserLogin";
  static const myCardCourses = "myCourse";
}