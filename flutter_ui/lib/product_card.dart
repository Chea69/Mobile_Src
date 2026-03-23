import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171A3A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5CE6),
        elevation: 0,
        leading: const Icon(Icons.storefront_outlined, color: Colors.white),
        title: const Text(
          "Shop",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: ListView(
          children: const [
            ProductCard(
              bgColor: Color(0xFFF0B7B7),
              icon: Icons.volume_up_rounded,
              name: "Wireless Speaker",
              subtitle: "Bluetooth 5.0",
              price: "\$49.99",
            ),
            SizedBox(height: 16),
            ProductCard(
              bgColor: Color(0xFFB7D0F0),
              icon: Icons.headphones_rounded,
              name: "Headphones Pro",
              subtitle: "Noise Cancelling",
              price: "\$89.99",
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final String name;
  final String subtitle;
  final String price;

  const ProductCard({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.name,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF22254A),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Center(child: Icon(icon, size: 52, color: Colors.white70)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFFAAB0D5),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF00D084),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5F5CE6),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.shopping_bag_outlined, size: 16),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
