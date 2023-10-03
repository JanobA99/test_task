import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_task/presentation/pages/core/app_widget.dart';

import 'domain/common/app_init.dart';

void main() async {
  await Hive.initFlutter();
  await AppInit.create;

  /// bloc logger

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
        path: 'assets/translation',
        startLocale: const Locale('ru', 'RU'),
        fallbackLocale: const Locale('en', 'US'),
        child: AppWidget(
          dbService: AppInit.dbService!,
          connectivityX: AppInit.connectivityX!,
        ),
      ),
    ),
  );
}
