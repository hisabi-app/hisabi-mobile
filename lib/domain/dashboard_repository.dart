import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // User has reached the bottom
      // Fetch more data here
      // Example: fetchData();
    }
  }

  // Method to fetch data
  // Example:
  // Future<void> fetchData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   // Perform API call or fetch data from repository
  //   // After fetching data, update state and stop loading indicator
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Your dashboard widgets
            // Example:
            // if (isLoading) {
            //   // Show loading indicator
            //   return CircularProgressIndicator();
            // } else {
            //   // Show data
            //   return YourWidget();
            // }
          ],
        ),
      ),
    );
  }
}
