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
}
