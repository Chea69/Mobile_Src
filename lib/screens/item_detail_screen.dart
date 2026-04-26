import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item: $id')),
      body: Center(
        child: Text('Detail for "$id"', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
