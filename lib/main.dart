import 'package:e_learning_app/util/local_box.dart';
import 'package:e_learning_app/view/home_page.dart';
import 'package:e_learning_app/view/login/view/welcome_page.dart';
import 'package:e_learning_app/view/my_card/my_card_page.dart';
import 'package:e_learning_app/view/my_learning/my_learning_page.dart';
import 'package:e_learning_app/view/profile_page.dart';
import 'package:e_learning_app/view_model/home_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() async{
  await Hive.initFlutter();
  await Boxes.registerBox();
  await Boxes.openBoxes();

  return runApp(
  BBUApp());
}

class BBUApp extends StatefulWidget {
   BBUApp({super.key});

  @override
  State<BBUApp> createState() => _BBUAppState();

  
}

class _BBUAppState extends State<BBUApp> {


  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Boxes.closeBoxes();
    super.dispose();
    
  }
   // Example of fetching data from Hive (assuming this is Hive box setup)
   var isLogin = Hive.box(Boxes.appConfigBox).get(BoxKey.isLogin, defaultValue: false);

   @override
   Widget build(BuildContext context) {
     return MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => HomePageVM()),
       ],
       child: MaterialApp(
         builder: FToastBuilder(),
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           colorSchemeSeed: Colors.white,
           pageTransitionsTheme: PageTransitionsTheme(
             builders: {
               TargetPlatform.android: CupertinoPageTransitionsBuilder(),
               TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
             },
           ),
         ),
         // The home page (MainPage) will now have access to the providers
         home: isLogin ? MainPage() : WelcomePage(),
       ),
     );
   }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() =>
      _MainPageState();
}



class _MainPageState
    extends State<MainPage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MyCardPage(),
    MyLearning(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Boxes.closeBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Text(
            _selectedIndex == 0 ? "E-Learning App" :
            _selectedIndex == 1 ? "My Order" :
            _selectedIndex == 2 ? "My Learning" :
           'Profile', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: false,
         backgroundColor: Color(0xff009FC1),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add),
            label: 'My Order',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Learning',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff009FC1),
        onTap: _onItemTapped,
      ),
    );
  }
}


