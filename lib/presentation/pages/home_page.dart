import 'package:cashify_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:cashify_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final route = MaterialPageRoute(builder: (context) => HomePage());
  Widget? _currentPage;

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
  void initState() {
    super.initState();
    _currentPage = DashboardPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: (value) {
          setState(() {
            _currentPage = pages[value];
          });
        },
      ),
      body: Center(child: _currentPage),
    );
  }
}
