import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundImageComponent extends StatelessWidget {
  final Widget child;

  const BackgroundImageComponent({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          'assets/images/im_background.svg',
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
