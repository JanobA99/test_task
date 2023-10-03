import 'package:dartz/dartz.dart';
import 'package:test_task/infrastructure/models/auth/auth.dart';

import '../common/failure.dart';
import 'auth_failure.dart';

abstract class IAuthFacade {
  Option<AuthFailure> checkUser();
  Future<Either<ResponseFailure, LoginResponse>> login(
      {required LoginRequest request});
}
