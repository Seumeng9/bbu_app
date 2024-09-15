
import 'dart:async';

import 'package:e_learning_app/model/course.dart';
import 'package:e_learning_app/util/loading_cus.dart';
import 'package:e_learning_app/view/home_page/detail_page.dart';
import 'package:e_learning_app/view/widget/widtet_custom.dart';
import 'package:e_learning_app/view_model/home_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'home_page';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int index = 0;
  
  static String videoID = 'egMWlD3fLJ8';
  // YouTube Video Full URL : https://www.youtube.com/watch?v=egMWlD3fLJ8

  bool isFullScreen = false;
  TextEditingController _searchTextContorller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  // final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 12', 'Item 23', 'Item 34', 'Item 14', 'Item 212', 'Item 333'];
  List<CourseItem> courses = [];
  bool _isLoadingMore = false;

  // var homePageVM = HomePageVM();

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
  void initState(){
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      var c = context.read<HomePageVM>().courses;

      print("course ==>>> $c");

      if(c?.courseList != null) {
        setState(() {
          courses = c!.courseList!;
        });
      }else {
        getCourses();
        print("after: ${context.read<HomePageVM>().courses}");
      }
    });


    //Search TextField Listener
    _searchTextContorller.addListener(() {
      print(_searchTextContorller.text);
    });

    
  }

  void getCourses() async{

    try {
      if(mounted){
        LoadingService().showLoading(context);
      }

      await context.read<HomePageVM>().getCourses();

      courses = context.read<HomePageVM>().courses?.courseList ?? [];


      print("category: ==>> ${courses.first.category?.name}");
      print("course tag: ${courses[2].courseTags?.first.title}");

      LoadingService().dismissLoading(context);
    }catch (e){
      LoadingService().dismissLoading(context);
    }

    

    setState(() {
      
    });

  }

  
  @override
  Widget build(BuildContext context) {

    final List<String> items = ['Python', 'java', 'aws', 'Make Money', 'reactjs', 'csharp programming'];

    return PopScope(
      canPop: false,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,
                  color: Colors.black),
                    hintText: ' Search here',
                    hintStyle: const TextStyle(color: Color(0xffBCBBBF), fontWeight: FontWeight.bold, height: 1.2),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 6, // Adjust spacing between buttons as needed
              runSpacing: 1,
              children: items.map((item) {
                return TextButton(
                  onPressed: () {
                    // Button press logic here
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text(item),
                );
              }).toList(),
            ),
            Row(
              children: [
                Text("Top Course", style: TextStyle(color: Color(0xff00677D), fontSize: 20),),
                Spacer(),
                TextButton(onPressed: (){
      
                }, child: Text("See all »", style: TextStyle(fontSize: 14, color: Color(0xff6F60DF)),)
                )
              ],
            ),
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
                      itemCount: courses.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < courses.length) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsScreen(course: courses[index],)));
                                },
                                child: courseItem(context, courses[index])),
                              index == courses.length ? SizedBox(height: 40,) : SizedBox()
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
    // return Container(
    //   child: TextButton(child: Text("Hello world Homepage"), onPressed: () {
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage()));
    //   },),
    // );
  }

   searchSuggestionsTiem(String text) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration:
          BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
      ),
    );
  }

}