import 'package:e_learning_app/model/course.dart';
import 'package:e_learning_app/util/local_box.dart';
import 'package:e_learning_app/view/checkout_page.dart';
import 'package:e_learning_app/view/login/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CourseDetailsScreen extends StatefulWidget {
  CourseItem course;
  CourseDetailsScreen({super.key, required this.course}); 

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;
  var _selectedIndex = 0;
  var _isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
    });

    _isLogin = Hive.box(Boxes.appConfigBox).get(BoxKey.isLogin, defaultValue: false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff009FC1),
        title: const Text('Course Details', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(top: 10),
            child: 
             DefaultTabController(
              length: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Image.asset("asset/images/pythonCourse.png", height: 130, width: MediaQuery.of(context).size.width - 20, fit: BoxFit.cover,),
                  SizedBox(height: 10,),
          
                  // Other content above the tabs
                  TabBar(
                    
                    controller: tabController,
                    // dividerColor: Colors.transparent,
                    // dividerHeight: 0,
                    indicatorPadding: EdgeInsets.zero,
                    indicator: null,
                    labelPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    // labelColor: Colors.red,
                    // indicatorColor: Colors.transparent,
                    // indicatorWeight: 0.1,
                    tabs: [
                      Tab(child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        color: _selectedIndex == 0 ? Color(0xff009FC1) : Colors.white, child: Text("Overview", style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.black),),)),
                      Tab(child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        color: _selectedIndex == 1 ? Color(0xff009FC1) : Colors.white, child: Text("Lession" , style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.black),),)),
                      Tab(child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        color: _selectedIndex == 2 ? Color(0xff009FC1) : Colors.white, child: Text("Review", style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.black),),))
                    
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        // Overview tab content
                        Center(child:_bodyOverview()),
                        // Lessons tab content
                        Center(child: _lesssionBody()),
                        // Reviews tab content
                        Center(child: _reviewBody()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Checkout Button
          Padding(padding: EdgeInsets.only(bottom: 20), child: 
          ElevatedButton(
            
            onPressed: () {
              // Handle button press
              if(_isLogin){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPage()));
              }else {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
              }
            },
            child:
            Container(
              alignment: Alignment.center,
              height: 15,
              width: MediaQuery.of(context).size.width*0.8 , child: Text('Continue To Checkout', style: TextStyle(color: Colors.white),),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff009FC1), // Set the button's background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Set the button's border radius
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Set the button's padding
              ),
          ),),
        ],
      ),
      
      
    );
  }

  Widget _bodyOverview() {
    var tags = widget.course.courseTags?.map((tag) => tag.title).toList();

    return SingleChildScrollView(
      child: Padding(
            padding: const EdgeInsets.only(top: 10),  
      
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
      
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
      
                      children: [
                        const  
                       Text(
                          'Python Coding',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'By Tom Makesman',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Color(0xffFFBC10)),
                            Icon(Icons.star, color: Color(0xffFFBC10)),
                            Icon(Icons.star, color: Color(0xffFFBC10)),  
      
                            Icon(Icons.star, color: Color(0xffFFBC10)),
                            Icon(Icons.star_border, color: Colors.grey),  
      
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '\$${widget.course.price}',
                      style: TextStyle(
                        fontSize: 20,
                        height: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'This course includes:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('10.5 hrs on-demand video'),
                ),
                const ListTile(
                  leading: Icon(Icons.devices),
                  title: Text('Access on all devices'),
                ),
                const ListTile(
                  leading: Icon(Icons.dock_outlined),
                  title: Text('Certificate of completion'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'What will you learn:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  '${widget.course.courseLearning}',
                  // 'There are many variations of passages of Ipsum available, but the majority have suffered alteration in some form  by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure theret anything embarrassing hidden in the middle of text. All the Lorem Ipsum generator',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Skills:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,  
      
                  ),
                ),
                SizedBox(height: 5,),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: 
                    tags!.map((item) {
                      return _skillItem(item ?? "");
                    }).toList(),
                  
                ),
                const SizedBox(height: 75),
                
              ],
            ),
          ),
    );
  }


  final ScrollController _lessionScrollController = ScrollController();

  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 12', 'Item 23', 'Item 34', 'Item 14', 'Item 212', 'Item 333'];

  Widget _lesssionBody (){

    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5),

      child: NotificationListener<ScrollNotification>(
              onNotification: 
            (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification && _lessionScrollController.position.pixels ==
                            _lessionScrollController.position.maxScrollExtent) {
                      // _loadMoreItems();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    controller: _lessionScrollController,
                    itemCount: _items.length ,
                    itemBuilder: (context, index) {
                      if (index < _items.length) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
                              },
                              child: _lessionItem(index)),
                            index == _items.length ? SizedBox(height: 40,) : SizedBox()
                          ],
                        );
                      } else {
                        return Container(margin: EdgeInsets.all(10), width: 20, height: 20, child: const Center(child: CircularProgressIndicator()));
                      }
                    },
                  ),
                ),
    );
    
  }
  


  Widget _lessionItem(int idx) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: (idx == _items.length -1) ? 75 : 2),
      child: ElevatedButton(
              
              onPressed: () {
                // Handle button press
              },
              child:
              Container(
                alignment: Alignment.center,
                height: 15,
                width: MediaQuery.of(context).size.width*0.8 , child: Text('Lession ${idx+1}: Introduction', style: TextStyle(color: Colors.black),),)
               ,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE9F2F0), // Set the button's background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Set the button's border radius
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Set the button's padding
              ),
            ),
    );
  }


  final ScrollController _reviewScrollController = ScrollController();

  final List<String> _reviewITems = ['Item 1', 'Item 2', 'Item 3', 'Item 12', 'Item 23', 'Item 34', 'Item 14', 'Item 212', 'Item 333'];

  Widget _reviewBody (){

    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5),

      child: NotificationListener<ScrollNotification>(
              onNotification: 
            (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification && _lessionScrollController.position.pixels ==
                            _lessionScrollController.position.maxScrollExtent) {
                      // _loadMoreItems();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    controller: _lessionScrollController,
                    itemCount: _reviewITems.length ,
                    itemBuilder: (context, index) {
                      if (index < _reviewITems.length) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
                              },
                              child: _reviewItemView(index)),
                            index == _reviewITems.length ? SizedBox(height: 40,) : SizedBox()
                          ],
                        );
                      } else {
                        return Container(margin: EdgeInsets.all(10), width: 20, height: 20, child: const Center(child: CircularProgressIndicator()));
                      }
                    },
                  ),
                ),
    );
    
  }

  Widget _reviewItemView(int idx) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: idx==_reviewITems.length-1 ? 80 : 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // height: 100,
      decoration: BoxDecoration(
        color: Color(0xffE9F2F0),
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Arcaaz Shaikh", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Expanded(
            child: Text(
              "I Think video needs to be more longer and little bit more in depth",
              style: TextStyle(fontSize: 12),
            )),
      Row(
        children: [
          Text("4.0", style: TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          Row(
            children: const [
              Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
              Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
              Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
              Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
              Icon(Icons.star_border, color: Colors.grey, size: 14,),
            ],
          ),
        ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillItem(String text) {
    return Container(
      // margin: EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration:
          BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
      ),
    );
  }
}