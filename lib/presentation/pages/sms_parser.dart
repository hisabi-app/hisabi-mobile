import 'package:hisabi_mobile_flutter/domain/sms_repository.dart';
import 'package:hisabi_mobile_flutter/data/models/sms_model.dart';
import 'package:flutter/material.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/update_bank_list.dart';
import 'package:telephony/telephony.dart';

class SMSParserPage extends StatelessWidget {
  final route = MaterialPageRoute(
      builder: (context) => SMSParserPage(
            smsRepository: TelephonyRepository(),
          ));
  SMSParserPage({required this.smsRepository});

  final SmsRepository smsRepository;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          const Text("SMS Parser"),
          SizedBox(
            height: height * 0.05,
          ),
          const Text("Lets try importing SMS for a start"),
          SizedBox(
            height: height * 0.05,
          ),
          Expanded(
            child: FutureBuilder(
              future: smsRepository.fetchFromInbox(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}"); // Show error message
                } else {
                  final senders = snapshot.data!
                      .map(
                        (e) {
                          return e.address;
                        },
                      )
                      .toSet()
                      .toList();
                  final sendersDropDownItems = senders.map(
                    (e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    },
                  ).toList();

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UpdateBankList(
                                  sendersDropDownItems: sendersDropDownItems),
                            ));
                          },
                          child: Text("Update List Of Banks"),
                        ),
                        Column(
                          children: snapshot.data!.map((element) {
                            return Row(
                              children: [
                                Text(element.id),
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                Text(element.address),
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                Text(element.body),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Import SMS"),
          ),
        ],
      ),
    );
  }
}
