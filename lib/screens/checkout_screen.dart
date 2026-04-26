import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'success'),
              child: const Text('Confirm Order'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context, 'cancelled'),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

// Call this from any screen to open checkout
Future<void> openCheckout(BuildContext context) async {
  final result = await Navigator.push<String>(
    context,
    MaterialPageRoute(builder: (_) => const CheckoutScreen()),
  );

  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        result == 'success'
            ? '✅ Order placed successfully!'
            : '❌ Checkout was cancelled.',
      ),
      backgroundColor: result == 'success' ? Colors.green : Colors.red,
    ),
  );
}
