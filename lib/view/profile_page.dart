import 'package:e_learning_app/util/local_box.dart';
import 'package:e_learning_app/view/login/view/login_page.dart';
import 'package:e_learning_app/view/login/view/welcome_page.dart';
import 'package:e_learning_app/view/video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              heightFactor: 1,
              child: CircleAvatar(
                radius: 70,
                backgroundImage:
                NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuphMb4mq-EcVWhMVT8FCkv5dqZGgvn_QiA&s",)
                // AssetImage('assets/profile_picture.jpg'), // Replace with your image path
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Your Full Name'),
            const SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('your_email@example.com'),
            const SizedBox(height: 16),
            Text(
              'Phone Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Your Phone Number'),

            const SizedBox(height: 12),

            Center(
              child: Text("Archievement", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            // const SizedBox(height: 8),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.dock_outlined),
                  title: const Text('Certificate'),
                  onTap: () {
                    // Handle achievement certificate tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('Completed Course'),
                  onTap: () {
                    // Handle completed course tap
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
              onPressed: () {
                // Handle sign out button press
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage()));
                //Clear box
                Hive.box(Boxes.appConfigBox).put(BoxKey.isLogin, false);
                Hive.box(Boxes.appConfigBox).put(BoxKey.token, "");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VideoPlayerScreen()));
              },
              child: const Text('Sign Out'),
            ),
            ),

          ],
        ),
      );
  }
}