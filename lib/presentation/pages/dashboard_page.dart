import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/dashboard_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => DashboardPage());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final netWorth = NetWorthRepo();
    final token = context.read<AppCubit>().state.token;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Account Overview",
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  FutureBuilder(
                      future: netWorth.getQuery(token, "", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container(
                            padding: EdgeInsets.only(
                                left: width * 0.02, top: height * 0.01),
                            height: height * 0.2,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Net Worth",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  "AED ${snapshot.data!.round() / 1000}k",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  FutureBuilder(
                      future: TotalCashRepo().getQuery(token, "", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container(
                            padding: EdgeInsets.only(
                                left: width * 0.02, top: height * 0.01),
                            height: height * 0.2,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Cash",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  "AED ${snapshot.data.round() / 1000}k",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  FutureBuilder(
                      future: TotalInvestmentRepo().getQuery(token, "", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container(
                            padding: EdgeInsets.only(
                                left: width * 0.02, top: height * 0.01),
                            height: height * 0.2,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Investment",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  "AED ${snapshot.data!.round() / 1000}k",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  FutureBuilder(
                      future: TotalIncomeRepo()
                          .getQuery(token, "current-month", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container(
                            padding: EdgeInsets.only(
                                left: width * 0.02, top: height * 0.01),
                            height: height * 0.2,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Income",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  "AED ${snapshot.data[0].round()}k",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  FutureBuilder(
                      future: TotalExpensesRepo()
                          .getQuery(token, "current-month", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container(
                            padding: EdgeInsets.only(
                                left: width * 0.02, top: height * 0.01),
                            height: height * 0.2,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Expenses",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text(
                                  "AED ${snapshot.data[0].round()}k",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                  Text("Total Income Trend"),
                  Text("Total Expenses Trend"),
                  Text(
                    "Categories Analytics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Brands Analytics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Facts",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Visualization",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
