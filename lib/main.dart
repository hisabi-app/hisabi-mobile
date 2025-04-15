import 'package:hisabi_mobile_flutter/features/authentication/data/repository/auth_repository.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_state.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/landing_screen.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepository())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}
