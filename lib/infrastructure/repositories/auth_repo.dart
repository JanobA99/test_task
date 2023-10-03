import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_task/domain/common/failure.dart';
import 'package:test_task/domain/common/token_ext.dart';
import 'package:test_task/infrastructure/models/auth/auth.dart';
import 'package:test_task/infrastructure/services/log_service.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/common/token.dart';
import '../apis/apis.dart';
import '../core/exceptions.dart';
import '../services/db_service.dart';

class AuthRepository implements IAuthFacade {
  final DBService _dbService;
  final AuthService _authService;

  AuthRepository(
    this._dbService,
    this._authService,
  );

  /// Get user
  @override
  Option<AuthFailure> checkUser() {
    final Token token = _dbService.token;
    return optionOf(token.hasFailure);
  }

  @override
  Future<Either<ResponseFailure, LoginResponse>> login(
      {required LoginRequest request}) async {
    try {
      final res = await _authService.login(request: request);
      if (res.isSuccessful) {
        _dbService.setToken(Token(
            accessToken: res.body?.tokens?.accessToken,
            refreshToken: res.body?.tokens?.refreshToken));
        return right(res.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(e.toString());
      if (e is NetworkException) {
        return left(NetworkFailure(message: 'network_error'.tr()));
      } else if (e is UnimplementedError) {
        return left(Unknown(message: e.message ?? 'unknown_error'.tr()));
      } else {
        return left(Unknown(message: 'unknown_error'.tr()));
      }
    }
  }


//
//
// /// Get user
// @override
// Future<Either<AuthFailure, String>> checkUser() async {
//   final Token token = _preferenceService.token;
//   final String? authType = _preferenceService.role;
//
//   if (token.accessToken == null && token.refreshToken == null) {
//     return left(const AuthFailure.unAuthenticated());
//   } else {
//     if (authType == null) {
//       return left(const AuthFailure.unknownRole());
//     } else {
//       return right(authType);
//     }
//   }
//
//   // optionOf(token.hasFailure);
// }
}
