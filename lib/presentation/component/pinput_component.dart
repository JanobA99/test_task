
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';

class PinPutComponent extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final void Function(String value) onChanged;

  const PinPutComponent({
    Key? key,
    required this.controller,
    this.validator,
    this.errorText, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, GridTheme gridController) {
        return Pinput(
          autofocus: true,
          length: 4,
          defaultPinTheme: PinTheme(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colors.borderColor,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          focusNode: FocusNode(),
          controller: controller,
          pinAnimationType: PinAnimationType.scale,
          validator: validator,
          errorText: errorText,
          forceErrorState: true,
          errorTextStyle:
              fonts.bodyText2.copyWith(fontSize: 14.sp, color: Colors.red),
          onChanged: onChanged,

        );
      },
    );
  }
}
