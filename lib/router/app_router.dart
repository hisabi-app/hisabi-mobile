import 'package:go_router/go_router.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/landing_screen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => LandingScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => DashboardScreen(),
      ),

      // Add other routes similarly...
    ],
  );
  // GoRouter get router => _router;
}
