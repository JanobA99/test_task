import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../infrastructure/services/connectivity.dart';
import '../../../infrastructure/services/db_service.dart';
import '../../component/custom_button.dart';
import '../../routes/routes.dart';
import '../../styles/theme_wrapper.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  Future<void> retry() async {
    EasyLoading.show();
    final result = await ConnectivityX().create();
    if (result) {
      DBService.create.then((value) => Navigator.pushAndRemoveUntil(
          context, AppRoutes.getAppWidget(value, result), (route) => false));
      EasyLoading.dismiss();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, c) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: SvgPicture.asset(c.isDark
              //       ? icons.noConnectionDarkSvg
              //       : icons.noConnectionLightSvg),
              // ),
              SizedBox(height: 25.h),
              Text('connection_is_afk'.tr(), style: fonts.headline3),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Text(
                  'no_connection_body'.tr(),
                  textAlign: TextAlign.center,
                  style: fonts.subtitle1,
                ),
              ),
              SizedBox(height: 20.h),
              CustomOutlinedButton(
                onPressed: retry,
                title: 'retry'.tr(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
