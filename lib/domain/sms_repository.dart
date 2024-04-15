import 'package:cashify_mobile_flutter/data/models/sms_model.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

abstract class SmsRepository {
  Future<List<SmsModel>> fetchFromInbox();
}

class TelephonyRepository extends SmsRepository {
  final Telephony telephony = Telephony.instance;

  @override
  Future<List<SmsModel>> fetchFromInbox() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    List<SmsMessage> messages = await telephony.getInboxSms();

    List<SmsModel> smsModels = messages
        .map((message) => SmsModel(text: message.body.toString()))
        .toList();
    return smsModels;
  }
}
