import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../models/auth/auth.dart';

part 'serializer.g.dart';

@SerializersFor([
  LoginResponse,
  LoginRequest,
  Tokens,
  User,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
