import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../infrastructure/models/auth/auth.dart';
import '../../infrastructure/repositories/auth_repo.dart';
import '../../infrastructure/services/log_service.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository,)
      : super(const _AuthState()) {
    on<_CheckAuth>(_checkAuth);
    on<_Login>(_loginHandler);
  }

  /// Authentication Check
  Future<void> _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    final res = _repository.checkUser();

    res.fold(
      () {
        return emit(state.copyWith(proceedToHome: true));
      },
      (error) {
        return emit(state.copyWith(proceedToHome: false));
      },
    );
  }



  FutureOr<void> _loginHandler(
    _Login event,
    Emitter<AuthState> emit,
  ) async {
    EasyLoading.show();
    final res = await _repository.login(request: event.request);

    res.fold((error) {
      EasyLoading.showError(error.message);
      LogService.e(" ----> error on _loginHandler  : $error");
    }, (data) {
      EasyLoading.dismiss();
      emit(state.copyWith(login: data, proceedToHome: true));
    });
  }



}
