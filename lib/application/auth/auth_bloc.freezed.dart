// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(LoginRequest request) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(LoginRequest request)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(LoginRequest request)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(
          _$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) =
      __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthImpl>
    implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(
      _$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(LoginRequest request) login,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(LoginRequest request)? login,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(LoginRequest request)? login,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthEvent {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginRequest request});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$LoginImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as LoginRequest,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.request});

  @override
  final LoginRequest request;

  @override
  String toString() {
    return 'AuthEvent.login(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(LoginRequest request) login,
  }) {
    return login(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(LoginRequest request)? login,
  }) {
    return login?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(LoginRequest request)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login({required final LoginRequest request}) = _$LoginImpl;

  LoginRequest get request;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  bool get proceedToVerifyCode => throw _privateConstructorUsedError;
  bool get proceedToHome => throw _privateConstructorUsedError;
  bool get proceedToSignUp => throw _privateConstructorUsedError;
  bool? get isHomeToBarber => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  AssetEntity? get assetEntity => throw _privateConstructorUsedError;
  LoginResponse? get login => throw _privateConstructorUsedError;
  LoginResponse? get verifyRegister => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool proceedToVerifyCode,
      bool proceedToHome,
      bool proceedToSignUp,
      bool? isHomeToBarber,
      String? imagePath,
      AssetEntity? assetEntity,
      LoginResponse? login,
      LoginResponse? verifyRegister});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proceedToVerifyCode = null,
    Object? proceedToHome = null,
    Object? proceedToSignUp = null,
    Object? isHomeToBarber = freezed,
    Object? imagePath = freezed,
    Object? assetEntity = freezed,
    Object? login = freezed,
    Object? verifyRegister = freezed,
  }) {
    return _then(_value.copyWith(
      proceedToVerifyCode: null == proceedToVerifyCode
          ? _value.proceedToVerifyCode
          : proceedToVerifyCode // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToSignUp: null == proceedToSignUp
          ? _value.proceedToSignUp
          : proceedToSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isHomeToBarber: freezed == isHomeToBarber
          ? _value.isHomeToBarber
          : isHomeToBarber // ignore: cast_nullable_to_non_nullable
              as bool?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      assetEntity: freezed == assetEntity
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as LoginResponse?,
      verifyRegister: freezed == verifyRegister
          ? _value.verifyRegister
          : verifyRegister // ignore: cast_nullable_to_non_nullable
              as LoginResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool proceedToVerifyCode,
      bool proceedToHome,
      bool proceedToSignUp,
      bool? isHomeToBarber,
      String? imagePath,
      AssetEntity? assetEntity,
      LoginResponse? login,
      LoginResponse? verifyRegister});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proceedToVerifyCode = null,
    Object? proceedToHome = null,
    Object? proceedToSignUp = null,
    Object? isHomeToBarber = freezed,
    Object? imagePath = freezed,
    Object? assetEntity = freezed,
    Object? login = freezed,
    Object? verifyRegister = freezed,
  }) {
    return _then(_$AuthStateImpl(
      proceedToVerifyCode: null == proceedToVerifyCode
          ? _value.proceedToVerifyCode
          : proceedToVerifyCode // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToHome: null == proceedToHome
          ? _value.proceedToHome
          : proceedToHome // ignore: cast_nullable_to_non_nullable
              as bool,
      proceedToSignUp: null == proceedToSignUp
          ? _value.proceedToSignUp
          : proceedToSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isHomeToBarber: freezed == isHomeToBarber
          ? _value.isHomeToBarber
          : isHomeToBarber // ignore: cast_nullable_to_non_nullable
              as bool?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      assetEntity: freezed == assetEntity
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as LoginResponse?,
      verifyRegister: freezed == verifyRegister
          ? _value.verifyRegister
          : verifyRegister // ignore: cast_nullable_to_non_nullable
              as LoginResponse?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {this.proceedToVerifyCode = false,
      this.proceedToHome = false,
      this.proceedToSignUp = false,
      this.isHomeToBarber = null,
      this.imagePath = null,
      this.assetEntity = null,
      this.login = null,
      this.verifyRegister = null})
      : super._();

  @override
  @JsonKey()
  final bool proceedToVerifyCode;
  @override
  @JsonKey()
  final bool proceedToHome;
  @override
  @JsonKey()
  final bool proceedToSignUp;
  @override
  @JsonKey()
  final bool? isHomeToBarber;
  @override
  @JsonKey()
  final String? imagePath;
  @override
  @JsonKey()
  final AssetEntity? assetEntity;
  @override
  @JsonKey()
  final LoginResponse? login;
  @override
  @JsonKey()
  final LoginResponse? verifyRegister;

  @override
  String toString() {
    return 'AuthState(proceedToVerifyCode: $proceedToVerifyCode, proceedToHome: $proceedToHome, proceedToSignUp: $proceedToSignUp, isHomeToBarber: $isHomeToBarber, imagePath: $imagePath, assetEntity: $assetEntity, login: $login, verifyRegister: $verifyRegister)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.proceedToVerifyCode, proceedToVerifyCode) ||
                other.proceedToVerifyCode == proceedToVerifyCode) &&
            (identical(other.proceedToHome, proceedToHome) ||
                other.proceedToHome == proceedToHome) &&
            (identical(other.proceedToSignUp, proceedToSignUp) ||
                other.proceedToSignUp == proceedToSignUp) &&
            (identical(other.isHomeToBarber, isHomeToBarber) ||
                other.isHomeToBarber == isHomeToBarber) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.assetEntity, assetEntity) ||
                other.assetEntity == assetEntity) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.verifyRegister, verifyRegister) ||
                other.verifyRegister == verifyRegister));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      proceedToVerifyCode,
      proceedToHome,
      proceedToSignUp,
      isHomeToBarber,
      imagePath,
      assetEntity,
      login,
      verifyRegister);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final bool proceedToVerifyCode,
      final bool proceedToHome,
      final bool proceedToSignUp,
      final bool? isHomeToBarber,
      final String? imagePath,
      final AssetEntity? assetEntity,
      final LoginResponse? login,
      final LoginResponse? verifyRegister}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  bool get proceedToVerifyCode;
  @override
  bool get proceedToHome;
  @override
  bool get proceedToSignUp;
  @override
  bool? get isHomeToBarber;
  @override
  String? get imagePath;
  @override
  AssetEntity? get assetEntity;
  @override
  LoginResponse? get login;
  @override
  LoginResponse? get verifyRegister;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
