import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth.g.dart';

//

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  LoginResponse._();

  factory LoginResponse([Function(LoginResponseBuilder b) updates]) =
      _$LoginResponse;
  @BuiltValueField(wireName: 'tokens')
  Tokens? get tokens;
  @BuiltValueField(wireName: 'user')
  User? get user;

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}

abstract class LoginRequest
    implements Built<LoginRequest, LoginRequestBuilder> {
  LoginRequest._();

  factory LoginRequest([Function(LoginRequestBuilder b) updates]) =
      _$LoginRequest;

  @BuiltValueField(wireName: 'email')
  String? get email;

  @BuiltValueField(wireName: 'password')
  String? get password;

  static Serializer<LoginRequest> get serializer => _$loginRequestSerializer;
}

abstract class Tokens implements Built<Tokens, TokensBuilder> {
  Tokens._();

  factory Tokens([Function(TokensBuilder b) updates]) = _$Tokens;

  @BuiltValueField(wireName: 'accessToken')
  String? get accessToken;
  @BuiltValueField(wireName: 'refreshToken')
  String? get refreshToken;

  static Serializer<Tokens> get serializer => _$tokensSerializer;
}

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([Function(UserBuilder b) updates]) = _$User;

  @BuiltValueField(wireName: 'id')
  int? get id;
  @BuiltValueField(wireName: 'email')
  String? get email;
  @BuiltValueField(wireName: 'nickname')
  String? get nickname;


  static Serializer<User> get serializer => _$userSerializer;
}
