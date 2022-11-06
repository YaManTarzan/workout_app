import 'package:currency_converter/add_workout_page.dart';
import 'package:currency_converter/profile_page.dart';
import 'package:currency_converter/workout_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final user = FirebaseAuth.instance.currentUser!;

  int currentPage = 0;

  final List<Widget> _pages = const [
    WorkoutPage(),
    AddWorkoutPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.orangeAccent,
        index: 0,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        items: const <Widget>[
          // Home page
          Icon(
            Icons.home,
            size: 40,
          ),
          // Add workout
          Icon(
            Icons.add,
            size: 50,
          ),
          // Profile page
          Icon(
            Icons.person,
            size: 40,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Signed in as: ${user.email!}"),
      //       MaterialButton(
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //         },
      //         color: Colors.deepOrange[200],
      //         child: const Text("Sign out"),
      //       ),
      //     ],
      //   ),
      // ),
      body: _pages[currentPage],
    );
  }
}
