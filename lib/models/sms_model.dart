import 'package:equatable/equatable.dart';

class SmsModel extends Equatable {
  const SmsModel({required this.text});
  final String text;

  factory SmsModel.empty() {
    return const SmsModel(text: "");
  }
  @override
  List<Object?> get props => [text];
}
