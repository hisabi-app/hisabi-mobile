import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  const AppState({
    required this.isLoggedIn,
    required this.token,
    required this.listOfBanks,
  });

  final bool isLoggedIn;
  final String token;
  final List<String> listOfBanks;

  @override
  // TODO: implement props
  List<Object?> get props => [isLoggedIn, token, listOfBanks];
  @override
  bool get stringify => true;

  AppState copyWith({
    bool? isLoggedIn,
    String? token,
    List<String>? listOfBanks,
  }) {
    return AppState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      token: token ?? this.token,
      listOfBanks: listOfBanks ?? this.listOfBanks,
    );
  }

  factory AppState.empty() {
    return const AppState(
      isLoggedIn: false,
      token: "",
      listOfBanks: [],
    );
  }
}
