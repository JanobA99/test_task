import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/common/token.dart';

class DBService {
  static const _dbName = 'localDB';
  static const _accessToken = 'access_token';
  static const _refreshToken = 'refresh_token';
  static const _id = 'id';
  static const _profileImage = 'profileImage';
  static const _name = 'name';
  static const _themeMode = 'theme_mode';

  static Box? _box;

  DBService._();

  static Future<DBService> get create async {
    _box ??= await Hive.openBox(_dbName);
    return DBService._();
  }

  /// Token
  Future<void> setToken(Token token) async {
    await _box?.put(_accessToken, token.accessToken ?? '');
    await _box?.put(_refreshToken, token.refreshToken ?? '');
  }

  Token get token {
    final accessToken = _box?.get(_accessToken);
    final refreshToken = _box?.get(_refreshToken);
    return Token(accessToken: accessToken, refreshToken: refreshToken);
  }

  /// ID
  Future<void> setId(String? id) async {
    await _box?.put(_id, id ?? "");
  }

  String get getId {
    final id = _box?.get(_id);

    return id ?? ("");
  }

  /// Profile Image
  Future<void> setProfileImage(String? profileImage) async {
    await _box?.put(_profileImage, profileImage ?? '');
  }

  static String get getProfileImage {
    final getProfileImage = _box?.get(_profileImage);

    return getProfileImage ?? ('');
  }

  /// Name
  Future<void> setName(String? name) async {
    await _box?.put(name, name ?? '');
  }

  static String get getName {
    final getName = _box?.get(_name);

    return getName ?? ('');
  }

  /// Name
  Future<void> setThemeMode(String? mode) async {
    await _box?.put(_themeMode, mode);
  }

  String? get getThemeMode {
    String? getName = _box?.get(_themeMode);
    return getName;
  }

  Future<void> signOut() async => await _box?.clear();
}
