import 'package:hisabi_mobile_flutter/domain/sms_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/brands_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/categories_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/landing_screen.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/sms_parser.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final route = MaterialPageRoute(builder: (context) => HomePage());
  Widget? _currentPage;
  int _currentPageIndex = 0;

  Future<void> _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored user data

    // Navigate back to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LandingScreen()),
    );
  }

  final navigationBarItems = const [
    BottomNavigationBarItem(label: "Dashbord", icon: Icon(Icons.dashboard)),
    BottomNavigationBarItem(
      label: "Transactions",
      icon: Icon(Icons.currency_exchange),
    ),
    BottomNavigationBarItem(
      label: "Brands",
      icon: Icon(Icons.branding_watermark),
    ),
    BottomNavigationBarItem(label: "Categories", icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: "Parser", icon: Icon(Icons.translate)),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final logo = SvgPicture.asset(height: height, 'assets/logo.svg');
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: height * 0.15,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: const Text(
                  "Settings Menu",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => _logout(context), // Call logout function
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true, // Ensures the drawer icon appears
        title: Row(
          children: [
            SizedBox(width: width * 0.14),
            SvgPicture.asset('assets/logo.svg', height: height * 0.05),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentPageIndex,
        onTap: (value) {
          setState(() {
            // _currentPage = pages[value];
            _currentPageIndex = value;
          });
        },
      ),
      body: Center(child: _currentPage),
    );
  }
}
