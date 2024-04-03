import 'package:cashify_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:cashify_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:cashify_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final route = MaterialPageRoute(builder: (context) => HomePage());
  StatelessWidget? _currentPage;
  int _currentPageIndex = 0;

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
    _currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final logo = SvgPicture.asset(
      height: height,
      'assets/logo.svg',
    );
    return Scaffold(
      appBar: AppBar(leadingWidth: width * 0.95, leading: logo),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentPageIndex,
        onTap: (value) {
          setState(() {
            _currentPage = pages[value];
            _currentPageIndex = value;
          });
        },
      ),
      body: Center(child: _currentPage),
    );
  }
}
