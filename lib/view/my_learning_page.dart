
import 'package:flutter/material.dart';

class MyLearning extends StatefulWidget {
  const MyLearning({super.key});
  static const routeName = 'my_learning';
  
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MyLearning());
  }

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
  final int index = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("My Learning Page")
    );
  }
}