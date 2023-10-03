import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/presentation/styles/theme.dart';

import '../../../styles/theme_wrapper.dart';

class BottomNavigationComponent extends StatelessWidget {
  final int pageIndex;
  final Function(int index) onTap;

  const BottomNavigationComponent(
      {Key? key, required this.pageIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (BuildContext context, CustomColorSet colors,
        FontSet fonts, IconSet icons, GridTheme controller) {
      return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10.r,
            offset: const Offset(0, -4),
          )
        ]),
        child: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            backgroundColor: colors.white,
            currentIndex: pageIndex,
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: fonts.caption.copyWith(
                fontWeight: FontWeight.w400,
                height: 2,
                fontSize: 10.sp,
                color: colors.black),
            selectedLabelStyle: fonts.caption.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                height: 2,
                color: colors.blue),
            showSelectedLabels: true,
            //selected item
            showUnselectedLabels: true,
            elevation: 0,
            onTap: (index) {
              onTap(index);
            },
            useLegacyColorScheme: false,
            items: [
              BottomNavigationBarItem(
                  icon: pageIndex == 0
                      ? SvgPicture.asset(
                          icons.lentaAc,
                          height: 24.h,
                        )
                      : SvgPicture.asset(
                          icons.lenta,
                          height: 24.h,
                        ),
                  label: 'lenta'.tr(),
                  backgroundColor: colors.white),
              BottomNavigationBarItem(
                icon: pageIndex == 1
                    ? SvgPicture.asset(
                        icons.mapAc,
                        height: 24.h,
                      )
                    : SvgPicture.asset(
                        icons.map,
                        height: 24.h,
                      ),
                label: 'map'.tr(),
              ),
              BottomNavigationBarItem(
                icon: pageIndex == 2
                    ? SvgPicture.asset(
                        icons.favouriteAc,
                        height: 24.h,
                      )
                    : SvgPicture.asset(
                        icons.favourite,
                        height: 24.h,
                      ),
                label: 'favourite'.tr(),
              ),
              BottomNavigationBarItem(
                icon: pageIndex == 3
                    ? SvgPicture.asset(
                        icons.profileAc,
                        height: 24.h,
                      )
                    : SvgPicture.asset(
                        icons.profile,
                        height: 24.h,
                      ),
                label: 'profile'.tr(),
              ),
            ]),
      );
    });
  }
}
