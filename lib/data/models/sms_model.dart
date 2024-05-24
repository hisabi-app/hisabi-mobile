import 'package:equatable/equatable.dart';

class SmsModel extends Equatable {
  const SmsModel({
    required this.id,
    required this.address,
    required this.body,
    required this.date,
  });
  final String id;
  final String address;
  final String body;
  final String date;

  factory SmsModel.empty() {
    return const SmsModel(id: "", address: "", body: "", date: "");
  }

  @override
  List<Object?> get props => [id, address, body, date];
}
