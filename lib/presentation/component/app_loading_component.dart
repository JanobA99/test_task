import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';

class AppLoadingComponent extends StatelessWidget {
  final bool showLoadingTextForIOS;

  const AppLoadingComponent({
    Key? key,
    this.showLoadingTextForIOS = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, GridTheme controller) {
        return Scaffold(
          body: Platform.isAndroid
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(colors.blue),
                    ),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CupertinoActivityIndicator(),
                      Visibility(
                        visible: showLoadingTextForIOS,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('Loading'),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
