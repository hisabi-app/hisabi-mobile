import 'package:cashify_mobile_flutter/domain/sms_repository.dart';
import 'package:cashify_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/home_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:cashify_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
        '/': (context) => HomePage(),
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
