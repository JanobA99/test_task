import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';
import '../../infrastructure/services/connectivity.dart';
import '../../infrastructure/services/db_service.dart';
import '../../infrastructure/services/log_service.dart';
import '../../presentation/styles/style.dart';

class AppInit {
  static bool? connectivityX;

  static DBService? dbService;

  AppInit._();

  static Future<AppInit> get create async {
    await appInitialized();
    connectivityX ??= await ConnectivityX().create();
    dbService ??= await DBService.create;
    return AppInit._();
  }

  static Future<void> appInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// LogService Create
    LogService.create;

    /// Easy Localization
    await EasyLocalization.ensureInitialized();

    /// Device Orientation
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _setupLogging();
    configLoading();
  }

  static void _setupLogging() => Logger.root
    ..level = kDebugMode ? Level.ALL : Level.WARNING
    ..onRecord.listen((record) => debugPrint(
          '${record.level.name}: '
          '${record.time} '
          '${record.loggerName}: '
          '${record.message}',
        ));

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 1)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Style.primary.withOpacity(0.4)
      ..errorWidget
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Style.primary.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
