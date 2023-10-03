import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import '../styles/theme_wrapper.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final String? error;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const CustomTextFieldPassword({
    Key? key,
    this.controller,
    this.hintText = '',
    this.title = '',
    this.isPassword = false,
    this.isEmail = false,
    this.error,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool isUnViziable = true;

  _changeVisibility() {
    setState(() {
      isUnViziable = !isUnViziable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.isNotEmpty
              ? Text(
                  widget.title,
                  style: fonts.subtitle1.copyWith(
                    color: widget.error == null ? colors.text : colors.error,
                  ),
                )
              : Container(),
          widget.title.isNotEmpty ? SizedBox(height: 6.h) : Container(),
          SizedBox(
            child: TextFormField(
              controller: widget.controller,
              style: fonts.bodyText2.copyWith(color: colors.text),
              obscureText: widget.isPassword && isUnViziable,
              keyboardType: _getKeyboardType(),
              validator: widget.validator,
              decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: _changeVisibility,
                        icon: Icon(
                          isUnViziable
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colors.icon,
                        ),
                      )
                    : null,
                focusColor: Style.secondary,
                fillColor: colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: colors.primary, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: colors.borderColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: colors.primary, width: 1),
                ),
                hintText: widget.hintText,
                hintStyle: fonts.bodyText1.copyWith(
                  color: colors.bodyText,
                ),
                errorText: widget.error,
                errorStyle: fonts.caption.copyWith(color: colors.error),
                contentPadding: EdgeInsets.only(left: 12.w),
              ),
            ),
          ),
        ],
      );
    });
  }

  TextInputType? _getKeyboardType() {
    if (widget.isEmail) {
      return TextInputType.emailAddress;
    } else if (widget.isPassword) {
      return TextInputType.visiblePassword;
    } else {
      return null;
    }
  }
}
