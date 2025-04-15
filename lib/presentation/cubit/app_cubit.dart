import 'package:hisabi_mobile_flutter/presentation/cubit/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(super.initialState);

  void updateState(AppState appState) {
    emit(appState);
  }
}
