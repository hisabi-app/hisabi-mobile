import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/data/dashboard_repository.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo repo;

  DashboardCubit(this.repo) : super(DashboardInitial());

  Future<void> loadInitialData() async {
    emit(DashboardLoading());
    Map<String, dynamic> dashboardMap = {};
    try {
      dashboardMap["financeVisualization"] = await repo.getFinanceVisualization(
        "current-month",
        1,
      );
      dashboardMap["avgValueTrn"] = await repo.getAvgValueTrn(
        "current-month",
        1,
      );
      // dashboardMap["trnStd"] = await repo.getTrnStd("current-month", category_1);
      dashboardMap["lowestValueTransaction"] = await repo
          .getLowestValueTransaction("current-month", 1);
      dashboardMap["highestValueTransaction"] = await repo
          .getHighestValueTransaction("current-month", 1);
      dashboardMap["noOfTransactionsPerBrand"] = await repo
          .getNoOfTransactionsPerBrand("current-month", 1);
      dashboardMap["noOfTrnPerCategory"] = await repo.getNoOfTrnPerCategory(
        "current-month",
        1,
      );
      dashboardMap["totalPerBrandTrend"] = await repo.getTotalPerBrandTrend(
        "current-month",
        1,
      );
      dashboardMap["noOfTrn"] = await repo.getNoOfTrn("current-month", 1);
      // dashboardMap["totalPerBrand"] = await repo.getTotalPerBrand("current-month", category_1);
      dashboardMap["queryTotalPerCategoryTrend"] = await repo
          .getQueryTotalPerCategoryTrend("current-month", 1);
      dashboardMap["incomePerCategory"] = await repo.getIncomePerCategory(
        "current-month",
        1,
      );
      dashboardMap["expensesPerCategory"] = await repo.getExpensesPerCategory(
        "current-month",
        1,
      );
      dashboardMap["totalExpensesTrend"] = await repo.getTotalExpensesTrend(
        "current-year",
        1,
      );
      final response = await repo.getTotalIncomeTrend("current-year", 1);
      dashboardMap["totalIncomeTrend"] = response;
      dashboardMap["totalIncome"] = await repo.getTotalIncome(
        "current-month",
        1,
      );
      dashboardMap["totalExpenses"] = await repo.getTotalExpenses(
        "current-month",
        1,
      );
      dashboardMap["totalInvestment"] = await repo.getTotalInvestment(
        "current-month",
        1,
      );
      dashboardMap["totalCash"] = await repo.getTotalCash("current-month", 1);
      dashboardMap["totalSavings"] = await repo.getTotalSavings(
        "current-month",
        1,
      );
      dashboardMap["netWorth"] = await repo.getNetWorth("current-month", 1);

      emit(DashboardLoaded(dashboardMap));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
