import 'package:cashify_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:cashify_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => HomePage());

  final pages = [
    DashboardPage(),
    TransactionsPage(),
    BrandsPage(),
    CategoriesPage(),
    SMSParserPage(),
  ];

  final navigationBarItems = const [
    BottomNavigationBarItem(label: "Dashbord", icon: Icon(Icons.dashboard)),
    BottomNavigationBarItem(
        label: "Transactions", icon: Icon(Icons.currency_exchange)),
    BottomNavigationBarItem(
        label: "Brands", icon: Icon(Icons.branding_watermark)),
    BottomNavigationBarItem(label: "Categories", icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: "Parser", icon: Icon(Icons.translate)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: (value) {
          print(value);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => pages[value]));
        },
      ),
      body: Center(child: const Text("Home Page")),
    );
  }
}
