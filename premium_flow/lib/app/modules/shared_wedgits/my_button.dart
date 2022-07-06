import 'package:flutter/material.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height,
      this.radius,
      this.color,
      this.elevation,
      this.overlayColor});

  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final double? elevation;
  final Color? overlayColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200, // <-- Your width
      height: height ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // foregroundColor: MaterialStateProperty.all(Colors.red),
          overlayColor: MaterialStateProperty.all(
              overlayColor ?? KlightPallet.secondColor),
          elevation: MaterialStateProperty.all(elevation ?? 0),
          backgroundColor:
              MaterialStateProperty.all(color ?? KlightPallet.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 30),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
