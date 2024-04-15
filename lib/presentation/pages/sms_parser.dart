import 'package:cashify_mobile_flutter/domain/sms_repository.dart';
import 'package:cashify_mobile_flutter/data/models/sms_model.dart';
import 'package:flutter/material.dart';
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
                  return SingleChildScrollView(
                    child: Column(
                      children: snapshot.data!.map((element) {
                        return Text(element.text);
                      }).toList(),
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
