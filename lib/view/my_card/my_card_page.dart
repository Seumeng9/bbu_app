
import 'package:e_learning_app/model/course.dart';
import 'package:e_learning_app/util/local_box.dart';
import 'package:e_learning_app/view/home_page/detail_page.dart';
import 'package:e_learning_app/view/my_learning/my_learning_detail_page.dart';
import 'package:e_learning_app/view/widget/widtet_custom.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});
  static const routeName = 'my_learning';
  
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MyCardPage());
  }

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  final int index = 1;

  final ScrollController _scrollController = ScrollController();
  late List<CourseItem> currentCourses;

  // final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 12', 'Item 23', 'Item 34', 'Item 14', 'Item 212', 'Item 333'];
  bool _isLoadingMore = false;

  void _loadMoreItems() async {
    setState(() {
      _isLoadingMore = true;
    });

    // Simulate loading more items (replace with your actual API call)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      // _items.addAll(['Item 4', 'Item 5']);
      _isLoadingMore = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(Boxes.appConfigBox);
    // Get the current list of courses from the box, or initialize an empty list
    CourseList c = (box.get(BoxKey.myCardCourses) ?? CourseList(courseList: []));
    currentCourses = c.courseList ?? [];

    
    
  }
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, bottom: 15),
            //   child: SizedBox(
            //     height: 45,
            //     child: TextField(
            //       decoration: InputDecoration(
            //       prefixIcon: const Icon(Icons.search,
            //       color: Colors.black),
            //         hintText: ' Search here',
            //         hintStyle: const TextStyle(color: Color(0xffBCBBBF), fontWeight: FontWeight.bold, height: 1.2),
            //         filled: true,
            //         fillColor: Colors.grey.withOpacity(0.3),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //           borderSide: BorderSide.none,
                
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Text("Your wishlist is here ", style: TextStyle(color: Color(0xff00677D), fontSize: 16),),
            SizedBox(height: 10,),
            Expanded(
              
              child: NotificationListener<ScrollNotification>(
                onNotification: 
              (ScrollNotification scrollInfo) {
                      if (scrollInfo is ScrollEndNotification && _scrollController.position.pixels ==
                              _scrollController.position.maxScrollExtent) {
                        _loadMoreItems();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: currentCourses.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < currentCourses.length) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsScreen(course: currentCourses[index],)));
                                },
                                child: courseItemMyCard(context, currentCourses[index])),
                              index == currentCourses.length ? SizedBox(height: 40,) : SizedBox()
                            ],
                          );
                        } else {
                          return Container(margin: EdgeInsets.all(10), width: 20, height: 20, child: const Center(child: CircularProgressIndicator()));
                        }
                      },
                    ),
                  ),
            )
            
          ],
        ),
      ),
    );
  }
}