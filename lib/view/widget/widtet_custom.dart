import 'package:e_learning_app/model/course.dart';
import 'package:e_learning_app/util/local_box.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget courseItem(BuildContext context, CourseItem item) {
  return Container(
    height: 105,
    // color: Colors.black26,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(top: 5, bottom: 5),
    margin: EdgeInsets.symmetric(vertical: 2),
    decoration: BoxDecoration(
      // color: Colors.grey[300],
      color: Colors.black87,
      borderRadius: BorderRadius.circular(15)),
    child: SizedBox(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        // Image.asset("asset/images/default_course.png", width: 137, height: 97,),
        Container(
          width: 137,
          margin: EdgeInsets.only(left: 4, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
      
            image: DecorationImage(
              image: AssetImage('asset/images/default_course.png'),
              fit: BoxFit.cover, 
      
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - (137 + 19 + 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title ?? "", style: TextStyle(color: Colors.white),),
              Row(
                children: [
                  Text("4.5", style: TextStyle(color: Colors.white),),
                  SizedBox(width: 5,),
                  Row(
                  children: const [
                    Icon(Icons.star, color: Color(0xffFFBC10), size: 17,),
                    Icon(Icons.star, color: Color(0xffFFBC10), size: 17),
                    Icon(Icons.star, color: Color(0xffFFBC10), size: 17),  

                    Icon(Icons.star, color: Color(0xffFFBC10), size: 17),
                    Icon(Icons.star_border, color: Colors.grey, size: 17),  
                  ],
                )
                ],
              ),
              Spacer(),
              // Text("Batic inro with the Development", style: TextStyle(color: Colors.white, fontSize: 7.73),),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline_outlined, color: Color(0xff543EE9), ),
                  SizedBox(width: 4,),
                  Text("Stephen Moris", style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                          
                    Text("\$${item.price}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    
                    // Spacer(),
                    // SizedBox(width: 40),
                          
                    InkWell(
                      onTap: () async {

                        _addCourse(item);
                        
                      },
                      child: Container(
                      
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        height: 22,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(blurRadius: 1, spreadRadius: 0.1, color: Colors.grey, )
                          ],
                          borderRadius: BorderRadius.circular(8)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("Add To Card", style: TextStyle(color: Colors.black),)
                      ),
                    ), 
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    ),
  );

}


// Adding a new course to the Hive box
_addCourse(CourseItem item) async {
  
    try {
      // await Boxes.openBoxes();

    // Open the box (replace 'courseBox' with your actual box name)
    var box = Hive.box(Boxes.appConfigBox);


    // Get the current list of courses from the box, or initialize an empty list
    CourseList currentCourses = box.get(BoxKey.myCardCourses) ?? CourseList(courseList: []);

    // Check if the course already exists by ID
    bool courseExists = currentCourses.courseList?.any((course) => course.id == item.id) ?? false;

    if (courseExists) {
      print('Course with ID ${item.id} already exists.');
      return; // Exit the function if the course already exists
    }

    // Add the new course to the list
    currentCourses.courseList?.add(item);

    print("current course=>> ${currentCourses}");

    // Put the updated list back into the box
    await box.put(BoxKey.myCardCourses, currentCourses);
    }catch(e){
      print(e);
    }
  
}



Widget courseItemAfterPurchase(BuildContext context) {
  return Container(
    height: 105,
    // color: Colors.black26,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    margin: const EdgeInsets.symmetric(vertical: 2),
    decoration: BoxDecoration(
      // color: Colors.grey[300],
      color: Color(0xcc009FC1),
      borderRadius: BorderRadius.circular(15)),
    child: SizedBox(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        // Image.asset("asset/images/default_course.png", width: 137, height: 97,),
        Container(
          width: 137,
          margin: EdgeInsets.only(left: 4, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
      
            image: const DecorationImage(
              image: AssetImage('asset/images/default_course.png'),
              fit: BoxFit.cover, 
      
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - (137 + 19 + 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Python Programming", style: TextStyle(color: Colors.white),),
              
              // Spacer(),
              SizedBox(height: 5,),
              Text("Batic inro with the Development", style: TextStyle(color: Colors.white, fontSize: 10),),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline_outlined, color: Color(0xff543EE9), ),
                  SizedBox(width: 4,),
                  Text("Stephen Moris", style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),

              
            ],
          ),
        )
      ]),
    ),
  );
}


Widget courseItemMyCard(BuildContext context, CourseItem courseItem) {
  return Container(
    height: 105,
    // color: Colors.black26,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    margin: const EdgeInsets.symmetric(vertical: 2),
    decoration: BoxDecoration(
      // color: Colors.grey[300],
      color: Color(0xcc009FC1),
      borderRadius: BorderRadius.circular(15)),
    child: SizedBox(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        // Image.asset("asset/images/default_course.png", width: 137, height: 97,),
        Container(
          width: 137,
          margin: EdgeInsets.only(left: 4, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
      
            image: const DecorationImage(
              image: AssetImage('asset/images/default_course.png'),
              fit: BoxFit.cover, 
      
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - (137 + 19 + 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courseItem.title ?? "", style: TextStyle(color: Colors.white),),
              
              // Spacer(),
              SizedBox(height: 5,),
              Text("${courseItem.courseLearning}", style: TextStyle(color: Colors.white, fontSize: 10),),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline_outlined, color: Color(0xff543EE9), ),
                  SizedBox(width: 4,),
                  Text("Stephen Moris", style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),

              
            ],
          ),
        )
      ]),
    ),
  );
}