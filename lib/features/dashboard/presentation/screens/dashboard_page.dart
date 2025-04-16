import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/data/dashboard_repository.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/combined_card.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/overview_card.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_card.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_chart_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DashboardLoaded) {
          final data = state.data;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Center(
                  child: const Text(
                    "Net Worth",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8),

                /// Row layout for Net Worth + 5 items
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Net Worth Block
                    Expanded(
                      // flex: 2,
                      child: Container(
                        // padding: const EdgeInsets.all(8),
                        height: 136,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        padding: EdgeInsets.symmetric(vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Net Worth',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 2),

                            Text(
                              (data["netWorth"]?.round()?.toDouble() ?? 0)
                                  .toStringAsFixed(0),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.currency_exchange,
                                  color: Colors.white70,
                                  size: 12,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  'AED',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    /// Cash, Savings, Investments
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          OverviewItemCard(
                            title: "Cash",
                            value: data["totalCash"]?.toDouble() ?? 0,
                            color: Colors.teal,
                            height: 45.333,
                            width: 100,
                            fontSize: 14,
                          ),
                          OverviewItemCard(
                            title: "Savings",
                            value: data["totalSavings"]?.toDouble() ?? 0,
                            color: Colors.deepPurple,
                            width: 100,

                            height: 45.333,
                            fontSize: 14,
                          ),
                          OverviewItemCard(
                            title: "Investments",
                            value: data["totalInvestment"]?.toDouble() ?? 0,
                            color: Colors.indigo,
                            height: 45.333,
                            width: 100,

                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    /// Income & Expenses
                    SizedBox(
                      width: width * .32,
                      child: Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OverviewItemCard(
                              title: "Income",
                              value: data["totalIncome"]?[0]?.toDouble() ?? 0.0,
                              color: Colors.green,
                              height: 68,
                              width: 200,
                              fontSize: 20,
                            ),
                            OverviewItemCard(
                              title: "Expenses",
                              value:
                                  data["totalExpenses"]?[0]?.toDouble() ?? 0.0,
                              color: Colors.red,
                              width: 200,
                              height: 68,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                Center(
                  child: const Text(
                    "Income VS Expenses",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 15),

                /// Combined Income/Expense Chart
                DashboardCombinedChart(
                  incomeData: data["totalIncomeTrend"] ?? [],
                  expenseData: data["totalExpensesTrend"] ?? [],
                  height: height * 0.25,
                ),
              ],
            ),
          );
        } else if (state is DashboardError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
