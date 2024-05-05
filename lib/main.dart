import 'package:hisabi_mobile_flutter/domain/sms_repository.dart';
import 'package:hisabi_mobile_flutter/firebase_options.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_state.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/landing_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephony/telephony.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    BlocProvider(
      create: (_) => AppCubit(
        AppState.empty(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LandingPage(),
        '/home': (context) => HomePage(),
        '/dashboard': (context) => DashboardPage(),
        '/transactions': (context) => TransactionsPage(),
        '/brands': (context) => BrandsPage(),
        '/categories': (context) => CategoriesPage(),
        '/sms_parser': (context) => SMSParserPage(
              smsRepository: TelephonyRepository(),
            ),
      },
    );
  }
}
