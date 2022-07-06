import 'package:flutter/material.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.hoverColor,
    this.highlightColor,
    this.onTap,
    this.isSelected,
  });

  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? hoverColor;
  final Color? highlightColor;
  final VoidCallback? onTap;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: highlightColor ?? Colors.transparent,
      hoverColor: hoverColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? kBorderRadius),
      child: Container(
        width: width ?? 200,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: (isSelected ?? false)
              ? hoverColor ?? Colors.transparent
              : (color ?? Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kBorderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
