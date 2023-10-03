
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';

class AppBarComponent2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String firstIconPath;
  final String secondIconPath;
  final VoidCallback? onFirstButtonPressed;
  final VoidCallback? onSecondButtonPressed;
  final Color? iconColor;
  final bool? autoLeading;
  final bool isAlignCenter;
  final Color? color;
  final Color? titleColor;
  final bool? isBorder;
  final bool? centerTitle;

  const AppBarComponent2({
    Key? key,
    this.title = '',
    this.firstIconPath = '',
    this.secondIconPath = '',
    this.isAlignCenter = true,
    this.onFirstButtonPressed,
    this.onSecondButtonPressed,
    this.iconColor,
    this.color,
    this.titleColor,
    this.isBorder,
    this.centerTitle,
    this.autoLeading,
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
                  width: 0.5,
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
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                          color: iconColor,
                        ),
                      ),
                if (isAlignCenter) const Spacer(),
                if (firstIconPath.isNotEmpty) SizedBox(width: 40.w),
                Text(
                  title,
                  textAlign:
                      centerTitle ?? true ? TextAlign.center : TextAlign.left,
                  style: fonts.bodyText1.copyWith(
                      fontSize: 20.sp,
                      color: titleColor ?? colors.text,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                (secondIconPath.isNotEmpty)
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: onFirstButtonPressed,
                            child: firstIconPath.isNotEmpty
                                ? SvgPicture.asset(firstIconPath,
                                    color: iconColor)
                                : SizedBox(
                                    width: 0.w,
                                  ),
                          ),
                          if (firstIconPath.isNotEmpty) SizedBox(width: 16.w),
                          GestureDetector(
                            onTap: onSecondButtonPressed,
                            child: secondIconPath.isNotEmpty
                                ? SvgPicture.asset(secondIconPath,
                                    color: iconColor)
                                : SizedBox(
                                    width: 0.w,
                                  ),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: 24.w,
                      ),
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
