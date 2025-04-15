import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  Authenticated(this.token);
  final String token;
  @override
  List<Object?> get props => [token];
}

class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class SignedOut extends AuthState {}
