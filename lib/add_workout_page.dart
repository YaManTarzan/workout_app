import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({super.key});

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Text(
              "Create a workout",
              style: TextStyle(
                  fontSize: 38, fontFamily: GoogleFonts.anton().fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}
