part of 'auth_bloc.dart';

@immutable
@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool proceedToVerifyCode,
    @Default(false) bool proceedToHome,
    @Default(false) bool proceedToSignUp,
    @Default(null) bool? isHomeToBarber,
    @Default(null) String? imagePath,
    @Default(null) AssetEntity? assetEntity,
    @Default(null) LoginResponse? login,
    @Default(null) LoginResponse? verifyRegister,
  }) = _AuthState;

}
