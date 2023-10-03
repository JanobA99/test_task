import 'package:chopper/chopper.dart';
import '../core/built_value_converter.dart';
import '../core/interceptors.dart';
import '../models/auth/auth.dart';

part 'apis.chopper.dart';

const String baseUrlP = "http://45.10.110.181:8080/api/v1";

@ChopperApi(baseUrl: '/auth/')
abstract class AuthService extends ChopperService {
  @Post(path: 'login')
  Future<Response<LoginResponse>> login({
    @Body() required LoginRequest request,
  });

  static AuthService create() => _$AuthService(_Client(baseUrlP, true));
}



base class _Client extends ChopperClient {
  _Client(String baseUrl, bool useInterceptors)
      : super(
            baseUrl: Uri.parse(baseUrl),
            interceptors: useInterceptors
                ? [
                    HttpLoggingInterceptor(),
                    CurlInterceptor(),
                    NetworkInterceptor(),
                    BackendInterceptor(),
                  ]
                : const [],
            converter: BuiltValueConverter(),
            errorConverter: ErrorMyConverter());
}
