import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String major;
  final String year;
  final bool favorite;
  final VoidCallback onPressed;

  const StudentCard({
    super.key,
    required this.name,
    required this.major,
    required this.year,
    required this.favorite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(major),
            Text(year),
            const SizedBox(height: 10),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
