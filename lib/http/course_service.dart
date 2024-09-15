
import 'package:e_learning_app/http/service_http.dart';
import 'package:e_learning_app/model/course.dart';
import 'package:e_learning_app/model/login.dart';

class CourseService {
  Future<CourseList> getCourses(String path) async {
    // req.role = ['ROLE_USER'];

    print("get course");
    
    var resp = await ServiceHttp().getRequest(uri: "/api/courses/page",path: path);

    // List<CourseItem> courseFromJson(String str) => List<CourseItem>.from(json.decode(str).map((x) => CourseItem.fromJson(x)));


  // String courseToJson(CourseList data) => json.encode(List<Map<String,
  // dynamic>>.from(data.map((x) => x.toJson())));



  return CourseList.fromJson(resp);

    
  }
  
  Future<Login> login(String username, String pass) async{

    var resp = await ServiceHttp().request(uri: "/api/auth/login", body: {
      'username': username,
      'password': pass,
    });

    return Login.fromJson(resp);

  }

}


// [
//     {
//         "id": 2,
//         "title": "C++ Level 1",
//         "price": 12.0,
//         "courseBy": 1,
//         "courseInclude": "Courses include text",
//         "courseLearning": "courseLearning detail",
//         "status": 1,
//         "categoryId": 1,
//         "createdBy": 2,
//         "createdAt": "2024-09-04T11:45:02.75199",
//         "updatedAt": "2024-09-04T11:45:02.75199"
//     },
//     {
//         "id": 3,
//         "title": "C++ Level 2",
//         "price": 12.0,
//         "courseBy": 1,
//         "courseInclude": "Courses include text",
//         "courseLearning": "courseLearning detail",
//         "status": 1,
//         "categoryId": 1,
//         "createdBy": 2,
//         "createdAt": "2024-09-04T11:45:05.910389",
//         "updatedAt": "2024-09-04T11:45:05.910389"
//     },
//     {
//         "id": 4,
//         "title": "C++ Level 3",
//         "price": 12.0,
//         "courseBy": 1,
//         "courseInclude": "Courses include text",
//         "courseLearning": "courseLearning detail",
//         "status": 1,
//         "categoryId": 1,
//         "createdBy": 2,
//         "createdAt": "2024-09-04T11:45:08.82265",
//         "updatedAt": "2024-09-04T11:45:08.82265"
//     },
//     {
//         "id": 1,
//         "title": "JavaScript Level 1",
//         "price": 12.0,
//         "courseBy": 1,
//         "courseInclude": "Courses include text",
//         "courseLearning": "courseLearning detail",
//         "status": 1,
//         "categoryId": 1,
//         "createdBy": 2,
//         "createdAt": "2024-09-04T11:44:05.602179",
//         "updatedAt": "2024-09-04T11:45:42.57281"
//     },
//     {
//         "id": 5,
//         "title": "C++ Level 4",
//         "price": 12.0,
//         "courseBy": 1,
//         "courseInclude": "Courses include text",
//         "courseLearning": "courseLearning detail",
//         "status": 1,
//         "categoryId": 1,
//         "createdBy": 2,
//         "createdAt": "2024-09-04T13:23:54.951067",
//         "updatedAt": "2024-09-04T13:23:54.951067"
//     }
// ]