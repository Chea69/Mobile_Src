import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['flutter', 'dart', 'nestjs'];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          // Ex 1 - Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Ex 1 — Profile (Adaptive Layout)'),
            onTap: () => context.go('/profile'),
          ),
          const Divider(),

          // Ex 2 + 3 - Items (go_router + deep link)
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Ex 2+3 — go_router + Deep Links',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...items.map(
            (item) => ListTile(
              leading: const Icon(Icons.link),
              title: Text(item),
              onTap: () => context.go('/home/item/$item'),
            ),
          ),
          const Divider(),

          // Ex 4 - Checkout
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Ex 4 — Checkout (Return Result)'),
            onTap: () => openCheckout(context),
          ),
          const Divider(),

          // Ex 5 - Catalog
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Ex 5 — Catalog (UI States)'),
            onTap: () => context.go('/catalog'),
          ),
        ],
      ),
    );
  }
}
