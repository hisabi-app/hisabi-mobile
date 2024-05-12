abstract class DashboardRepo {
  Future<String> getNetWorth();
  Future<String> getTotalCash();
  Future<String> getTotalSavings();
  Future<String> getTotalInvestment();
  Future<String> getTotalIncome();
  Future<String> getTotalExpenses();
  Future<String> getTotalIncomeTrend();
  Future<String> getTotalExpensesTrend();
  Future<String> getIncomePerCategory();
  Future<String> getExpensesPerCategory();
  Future<String> getTotalPerCategoryTrend();
  Future<String> getTotalPerBrand();
  Future<String> getTotalPerBrandTrend();
  Future<String> getNumberOfTransactions();
  Future<String> getNumberOfTransactionsPerCategory();
  Future<String> getNumberOfTransactionsPerBrand();
  Future<String> getHighestValueTransaction();
  Future<String> getLowestValueTransaction();
  Future<String> getAverageValueTransaction();
  Future<String> getTransactionsStandardDeviation();
  Future<String> getfinanceVisualizationCirclePackMetric();
}
