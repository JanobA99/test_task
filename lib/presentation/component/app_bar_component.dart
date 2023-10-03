import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';
import 'cached_image_component.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String iconPath;
  final String profilePicPath;
  final VoidCallback? onButtonPressed;
  final Color? iconColor;
  final bool? autoLeading;
  final Color? color;
  final bool? isBorder;

  const AppBarComponent({
    Key? key,
    this.title = '',
    this.iconPath = '',
    this.onButtonPressed,
    this.iconColor,
    this.color,
    this.isBorder,
    this.autoLeading,
    this.profilePicPath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, GridTheme controller) {
        return Container(
          height: kToolbarHeight * 2,
          decoration: BoxDecoration(
            color: color ?? colors.transparent,
            border: Border(
              bottom: BorderSide(
                  color: isBorder ?? false
                      ? colors.borderColor
                      : colors.transparent),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.w,
                top: MediaQuery.of(context).padding.top,
                right: 16.w),
            child: Row(
              children: [
                autoLeading ?? false
                    ? SizedBox(
                        height: profilePicPath.isNotEmpty ? 30.r : 0,
                        width: profilePicPath.isNotEmpty ? 30.r : 0,
                        child: profilePicPath.isNotEmpty
                            ? CachedImageComponent(
                                height: 30.r,
                                width: 30.r,
                                borderRadius: 6.r,
                                imageUrl: profilePicPath,
                              )
                            : null)
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios),
                      ),
                const Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: fonts.bodyText1.copyWith(
                      fontSize: 20.sp,
                      color: colors.text,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onButtonPressed,
                      child: iconPath.isNotEmpty
                          ? SvgPicture.asset(iconPath, color: iconColor)
                          : SizedBox(
                              width: 0.w,
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
