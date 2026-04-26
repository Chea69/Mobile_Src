import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum UiState { loading, empty, error, data }

class Product {
  const Product({required this.id, required this.name, required this.price});
  final String id;
  final String name;
  final double price;
}

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  UiState _state = UiState.loading;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _state = UiState.loading);
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _products = const [
        Product(id: '1', name: 'Flutter Book', price: 9.99),
        Product(id: '2', name: 'Dart Course', price: 19.99),
        Product(id: '3', name: 'UI Kit', price: 4.99),
        Product(id: '4', name: 'Icon Pack', price: 2.99),
      ];
      _state = UiState.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: buildCatalogBody(_state, _products),
    );
  }
}

Widget buildCatalogBody(UiState state, List<Product> products) {
  switch (state) {
    case UiState.loading:
      return const Center(child: CircularProgressIndicator());

    case UiState.empty:
      return const Center(child: Text('No products found'));

    case UiState.error:
      return const Center(child: Text('Something went wrong'));

    case UiState.data:
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
