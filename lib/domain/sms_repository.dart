// import 'package:hisabi_mobile_flutter/data/models/sms_model.dart';
// import 'package:flutter/material.dart';
// import 'package:telephony/telephony.dart';

// abstract class SmsRepository {
//   Future<List<SmsModel>> fetchFromInbox();
// }

// class TelephonyRepository extends SmsRepository {
//   final Telephony telephony = Telephony.instance;

//   @override
//   Future<List<SmsModel>> fetchFromInbox() async {
//     bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
//     List<SmsMessage> messages = await telephony.getInboxSms();
//     messages.forEach((element) {
//       print(
//           "id ${element.id} address ${element.address} body ${element.body} date ${element.date}");
//     });
//     List<SmsModel> smsModels = messages
//         .map((message) => SmsModel(
//               id: message.id.toString(),
//               address: message.address.toString(),
//               body: message.body.toString(),
//               date: message.date.toString(),
//             ))
//         .toList();
//     return smsModels;
//   }
// }
