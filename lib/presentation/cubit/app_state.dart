import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  const AppState({
    required this.isLoggedIn,
    required this.token,
  });

  final bool isLoggedIn;
  final String token;

  @override
  // TODO: implement props
  List<Object?> get props => [isLoggedIn];
  @override
  bool get stringify => true;

  AppState copyWith({
    bool? isLoggedIn,
    String? token,
  }) {
    return AppState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      token: token ?? this.token,
    );
  }

  factory AppState.empty() {
    return const AppState(
      isLoggedIn: false,
      token: "",
    );
  }
}
