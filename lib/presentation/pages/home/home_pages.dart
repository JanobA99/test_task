import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/application/auth/auth_bloc.dart';
import 'package:test_task/infrastructure/services/db_service.dart';
import 'package:test_task/presentation/pages/home/componets/bottom_navigation_components.dart';
import 'package:test_task/presentation/pages/home/componets/logout_bottomsheet.dart';
import 'package:test_task/presentation/routes/routes.dart';
import 'package:test_task/presentation/styles/theme.dart';
import 'package:test_task/presentation/styles/theme_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, CustomColorSet colors, fonts, icons, controller) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              appBar: AppBar(
                leading: const SizedBox(),
                centerTitle: true,
                backgroundColor: colors.white,
                elevation: 0.0,
                title: Text(
                  "profile".tr(),
                  style: fonts.headline3.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.black),
                ),
              ),
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 38.h, bottom: 15.h),
                      child: SvgPicture.asset(icons.profileBig),
                    ),
                    Text(state.login?.user?.nickname ?? "",
                        style: fonts.headline3.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: colors.black)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      state.login?.user?.email ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF919191),
                        fontSize: 16.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r)),
                            ),
                            context: context,
                            builder: (builder) {
                              return CustomAuthBottomSheet(
                                title: 'logout'.tr(),
                                content: "sure_logout".tr(),
                                onTap: () async {
                                  final dbser = context.read<DBService>();
                                  dbser.signOut().then((value) => {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            AppRoutes.getHomeControl(),
                                            (route) => false)
                                      });
                                },
                                titleButton: 'logout'.tr(),
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.w, vertical: 21.h),
                        width: double.infinity,
                        decoration:
                            const BoxDecoration(color: Color(0xFFFEFEFE)),
                        child: Text(
                          'logout'.tr(),
                          style: TextStyle(
                            color: colors.redText,
                            fontSize: 16.sp,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationComponent(
                pageIndex: 3,
                onTap: (index) {
                  // setState(() {
                  //   pageIndex = index;
                  // });
                },
              ),
            );
          },
        );
      },
    );
  }
}
