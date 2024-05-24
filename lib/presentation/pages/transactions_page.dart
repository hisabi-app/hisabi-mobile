import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final route = MaterialPageRoute(builder: (context) => TransactionsPage());

  final allTransactionsRepo = AllTransactionsRepo();

  void queryListener() {}

  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    final transactions = allTransactionsRepo.getTransactions(token, "");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
                future: transactions,
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
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Row(children: [
                            SizedBox(
                              width: width * 0.1,
                            ),
                            SearchBar(
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
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Container(width: width * 0.05, child: Text("ID")),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: width * 0.2,
                                child: Text("AMOUNT"),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: width * 0.15,
                                child: Text("BRAND"),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Container(
                                width: width * 0.2,
                                child: Text("CATEGORY"),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: width * 0.2,
                                child: Text("DATE"),
                              ),
                              // SizedBox(
                              //   width: width * 0.05,
                              // ),
                            ],
                          ),
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
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                                width: width * 0.07,
                                                child: Text(transaction.id)),
                                            Container(
                                              margin: EdgeInsets.only(left: 0),
                                              width: width * 0.15,
                                              child: Text(transaction.amount
                                                  .toString()),
                                            ),
                                            Container(
                                              width: width * 0.25,
                                              child: Text(
                                                  transaction.brand.brandName),
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Container(
                                              width: width * 0.17,
                                              child: Text(transaction
                                                  .brand.category.name),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("CREATE TRANSACTION")),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
