import 'package:flutter/material.dart';
import '../widgets/student_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool favorite = false;

  void toggleFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      body: Center(
        child: StudentCard(
          name: 'MA SOVITCHEA',
          major: 'Information Technology',
          year: 'Year 4',
          favorite: favorite,
          onPressed: toggleFavorite,
        ),
      ),
    );
  }
}
