import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/helper_widgets/create_transaction_popup.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final route = MaterialPageRoute(builder: (context) => TransactionsPage());

  final filteredTransactionsRepo = FilteredTransactionsRepo();
  SearchController _searchController = SearchController();
  String? _token;
  Future<dynamic>? _transactions;

  @override
  void initState() {
    super.initState();
    _token = "";
    _searchController.addListener(queryListener);
    _transactions = filteredTransactionsRepo.getTransactions(
        _token!, _searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.removeListener(queryListener);
    _searchController.dispose();
    super.dispose();
  }

  void queryListener() {
    setState(() {
      _transactions = filteredTransactionsRepo.getTransactions(
          _token!, _searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    setState(() {
      _token = token;
      _transactions = filteredTransactionsRepo.getTransactions(
          _token!, _searchController.text);
    });

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Row(children: [
                  SizedBox(
                    width: width * 0.1,
                  ),
                  SearchBar(
                    controller: _searchController,
                    leading: const Icon(Icons.search),
                    constraints: BoxConstraints(
                      maxWidth: width * 0.8,
                      minHeight: height * 0.05,
                    ),
                  ),
                ]),
                SizedBox(
                  width: width * 0.1,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                FutureBuilder(
                    future: _transactions,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height * 0.3),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Center(
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.45,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          final data = snapshot.data;
                                          final transaction = data![index];
                                          return Center(
                                            child: Container(
                                              width: width * 0.7,
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.03),
                                              margin: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.03),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.03,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${transaction.brand.brandName}",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        transaction.brand
                                                            .category.name,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    22,
                                                                    53,
                                                                    207)),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.2,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0),
                                                        width: width * 0.20,
                                                        child: Text(
                                                          "AED ${transaction.amount.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: width * 0.19,
                                                        child: Text(
                                                          transaction.date
                                                              .toString()
                                                              .substring(0, 10),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CreateTransactionPopup();
                                      },
                                    );
                                  },
                                  child: const Text("CREATE TRANSACTION")),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
