import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  const AppState({
    required this.isLoggedIn,
    required this.token,
    required this.listOfBanks,
    required this.newSubmission,
  });

  final bool isLoggedIn;
  final String token;
  final List<String> listOfBanks;
  final bool newSubmission;

  @override
  // TODO: implement props
  List<Object?> get props => [isLoggedIn, token, listOfBanks, newSubmission];
  @override
  bool get stringify => true;

  AppState copyWith({
    bool? isLoggedIn,
    String? token,
    List<String>? listOfBanks,
    bool? newSubmission,
  }) {
    return AppState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      token: token ?? this.token,
      listOfBanks: listOfBanks ?? this.listOfBanks,
      newSubmission: newSubmission ?? this.newSubmission,
    );
  }

  factory AppState.empty() {
    return const AppState(
        isLoggedIn: false, token: "", listOfBanks: [], newSubmission: false);
  }
}
