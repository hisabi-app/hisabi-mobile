import 'package:cashify_mobile_flutter/models/sms_model.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class SMSParserPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => SMSParserPage());

  Future<List<SmsModel>> fetchSmsfromInbox() async {
    final Telephony telephony = Telephony.instance;
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    List<SmsMessage> messages = await telephony.getInboxSms();

    List<SmsModel> smsModels = messages.map((message) {
      return SmsModel(text: message.body ?? '');
    }).toList();

    return smsModels;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          const Text("SMS Parser"),
          SizedBox(
            height: height * 0.1,
          ),
          const Text("Lets try importing SMS for a start"),
          SizedBox(
            height: height * 0.1,
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchSmsfromInbox(),
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
