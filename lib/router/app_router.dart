import 'package:go_router/go_router.dart';
import 'package:hisabi_mobile_flutter/domain/signup_repository.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/landing_screen.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // 👇 Public routes (no bottom nav)
    GoRoute(path: '/', builder: (context, state) => LandingScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),

    // 👇 ShellRoute wraps only the bottom nav pages
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder:
              (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/transactions',
          pageBuilder:
              (context, state) => NoTransitionPage(child: TransactionsPage()),
        ),
        GoRoute(
          path: '/brands',
          pageBuilder:
              (context, state) => NoTransitionPage(child: BrandsPage()),
        ),
        GoRoute(
          path: '/categories',
          pageBuilder:
              (context, state) => NoTransitionPage(child: CategoriesPage()),
        ),
        // Add more protected/nav-wrapped routes here
      ],
    ),
  ],
);
