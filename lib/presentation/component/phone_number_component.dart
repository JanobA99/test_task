import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';

class CountryPhoneNumberComponent extends StatelessWidget {
  final PhoneNumber initialCountry;
  final TextEditingController controller;

  const CountryPhoneNumberComponent({
    Key? key,
    required this.initialCountry,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, GridTheme gridController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.borderColor, width: 1.5.w),
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (number) {
              controller.text = number.toString();
              print(number);
            },
            onInputValidated: (value) {},
            maxLength: 9,
            validator: (value) => null,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: fonts.subtitle1.copyWith(
              fontSize: 16.sp,
            ),
            textStyle: fonts.subtitle1
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
            textAlignVertical: TextAlignVertical.top,
            initialValue: initialCountry,
            formatInput: false,
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(color: colors.blue, width: 2),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              focusColor: colors.white,
              fillColor: colors.white,
              filled: true,
            ),
            onSaved: (number) {
              print('saved');
            },
            onSubmit: () {
              FocusScope.of(context).unfocus();
              print('submit');
            },
          ),
        );
      },
    );
  }
}
