import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/data/dashboard_repository.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_card.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_chart_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
          return SizedBox(
            height: height * .8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  Text(
                    "Account Overview",
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
                  ),
                  SizedBox(height: height * 0.02),

                  /// Net Worth Card
                  DashboardCard(
                    title: "Net Worth",
                    value: data["netWorth"]?.round()?.toDouble() ?? 0,
                  ),

                  SizedBox(height: height * 0.02),

                  /// Total Cash Card
                  DashboardCard(
                    title: "Total Cash",
                    value: data["totalCash"]?.round()?.toDouble() ?? 0,
                  ),

                  SizedBox(height: height * 0.02),

                  /// Total Investment Card
                  DashboardCard(
                    title: "Total Investment",
                    value: data["totalInvestment"]?.round()?.toDouble() ?? 0,
                  ),

                  SizedBox(height: height * 0.02),

                  /// Total Income Card with Chart
                  DashboardCard(
                    title: "Total Income",
                    value: data["totalIncome"]?[0]?.toDouble() ?? 0,
                  ),

                  SizedBox(height: height * 0.02),

                  /// Total Expenses Card
                  DashboardCard(
                    title: "Total Expenses",
                    value: data["totalExpenses"]?[0]?.toDouble() ?? 0,
                  ),

                  /// Continue with rest...
                  DashboardChartCard(
                    title: "Total Income Trend",
                    value:
                        (data["totalIncomeTrend"]?.last["value"] ?? 0)
                            .toDouble(),
                    chartData: data["totalIncomeTrend"] ?? [],
                  ),
                  DashboardChartCard(
                    title: "Total Expenses Trend",
                    value:
                        (data["totalExpensesTrend"]?.last["value"] ?? 0)
                            .toDouble(),
                    chartData: data["totalExpensesTrend"] ?? [],
                  ),

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
