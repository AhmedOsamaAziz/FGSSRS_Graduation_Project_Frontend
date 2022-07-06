import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    required this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
  });

  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 12.00,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: overflow ?? TextOverflow.ellipsis,
      ),
      textAlign: textAlign,
    );
  }
}
