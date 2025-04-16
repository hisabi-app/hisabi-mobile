import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/features/authentication/data/repository/auth_repository.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(AuthInitial());
  final AuthRepository repository;

  Future<bool> login(String email, String password, bool remember) async {
    final deviceName = await repository.getDeviceName();
    try {
      emit(AuthLoading());
      final token = await repository.login(
        email,
        password,
        deviceName,
        remember,
      );
      emit(Authenticated(token));
      return true;
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
      return false;
    }
  }

  Future<void> checkIfLoggedIn() async {
    emit(AuthInitial());

    try {
      final result = await repository.checkIfLoggedIn();

      if (result != false && result is List && result.length == 2) {
        final email = result[0];
        final password = result[1];
        await login(email, password, true); // Important: Await login
        print("Auto-login succeeded");
      } else {
        print("No saved credentials");
      }
    } catch (e) {
      debugPrint("checkIfLoggedIn error: ${e.toString()}");
      emit(AuthError("Auto-login failed: ${e.toString()}"));
    }
  }
}
