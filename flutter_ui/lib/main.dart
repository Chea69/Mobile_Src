import 'package:flutter/material.dart';
// import 'profile_card.dart';
// import 'product_card.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ProfilePage(), //ex 3
      // home: ProductPage(), //ex 4
      home: DashboardPage(), //ex 5
    );
  }
}
