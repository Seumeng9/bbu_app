
import 'package:e_learning_app/view/home_page/detail_page.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(child: Text("Hello world Homepage"), onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage()));
      },),
    );
  }
}