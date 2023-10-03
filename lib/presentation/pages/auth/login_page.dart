import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/application/auth/auth_bloc.dart';
import 'package:test_task/infrastructure/models/auth/auth.dart';
import 'package:test_task/presentation/component/custom_button.dart';
import 'package:test_task/presentation/extensions/extension.dart';
import 'package:test_task/presentation/styles/theme_wrapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.context});
  final BuildContext context;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _passwordHidden = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoCheckEnabled = false;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Unfocuser(
          child: Scaffold(
            backgroundColor: colors.backgroundColor,
            appBar: AppBar(
              backgroundColor: colors.white,
              leading: const SizedBox(),
              centerTitle: true,
              title: Text(
                "auth".tr(),
                style: fonts.subtitle1,
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
            ),
            body: SafeArea(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                            autovalidateMode: _autoCheckEnabled
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintStyle: fonts.bodyText2
                                  .copyWith(color: const Color(0xffC3C7CE)),
                              hintText: "log_or_email".tr(),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "doNotLeaveBlank".tr();
                              } else {
                                if (!v.isValidEmail()) {
                                  return "enterValidEmail".tr();
                                } else {
                                  return null;
                                }
                              }
                            }),
                        Divider(
                          thickness: 1.h,
                          height: 10.h,
                        ),
                        TextFormField(
                          autovalidateMode: _autoCheckEnabled
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          controller: _passwordController,
                          obscureText: _passwordHidden,
                          decoration: InputDecoration(
                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         _passwordHiden = !_passwordHiden;
                            //       });
                            //     },
                            //     icon: const Icon(Icons.remove_red_eye_outlined)),
                            hintStyle: fonts.bodyText2
                                .copyWith(color: const Color(0xffC3C7CE)),
                            hintText: "password".tr(),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "doNotLeaveBlank".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 32.h),
                        CustomButton(
                          title: "sign_in".tr(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.context
                                  .read<AuthBloc>()
                                  .add(AuthEvent.login(
                                  request: LoginRequest(
                                        (p0) => p0
                                      ..email = _emailController.text
                                      ..password = _passwordController.text,
                                  )));
                            } else {
                              // TURN ON AUTO CHECK
                              // THIS AUTO CHECKER WILL BE ENABLED IF USER ENTER WRONG DETAILS, EMAIL OR PASSWORD

                              setState(() {
                                _autoCheckEnabled = true;
                              });
                            }
                            // LOGIN LOGIC
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomButton(
                          title:  "sign_up".tr(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            } else {
                              // TURN ON AUTO CHECK
                              // THIS AUTO CHECKER WILL BE ENABLED IF USER ENTER WRONG DETAILS, EMAIL OR PASSWORD

                              setState(() {
                                _autoCheckEnabled = true;
                              });
                            }
                            // LOGIN LOGIC
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
