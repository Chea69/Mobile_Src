import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/item_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/catalog_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (_, _) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'item/:id',
          builder: (_, state) {
            final id = state.pathParameters['id']!;
            return ItemDetailScreen(id: id);
          },
        ),
      ],
    ),
    GoRoute(path: '/profile', builder: (_, _) => const ProfileScreen()),
    GoRoute(path: '/checkout', builder: (_, _) => const CheckoutScreen()),
    GoRoute(path: '/catalog', builder: (_, _) => const CatalogScreen()),
  ],
);
