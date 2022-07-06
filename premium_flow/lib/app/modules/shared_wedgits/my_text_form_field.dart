import 'package:flutter/material.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    required this.onSaved,
    this.enabled,
    this.controller,
    this.isPassword,
    this.onSuffixPressed,
    this.validator,
    this.allowShadow,
    this.fillColor,
    this.withLable,
    this.radius,
    this.height,
    this.keyboardType,
    this.autovalidateMode,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final FormFieldSetter<String> onSaved;
  final bool? enabled;
  final TextEditingController? controller;
  final bool? isPassword;
  final VoidCallback? onSuffixPressed;
  final String? Function(String?)? validator;
  final bool? allowShadow;
  final Color? fillColor;
  final bool? withLable;
  final double? radius;
  final double? height;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: height ?? 40,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hoverColor: KlightPallet.secondColorHover,
            focusColor: Colors.red,
            //KlightPallet.secondColorfOCUS,
            fillColor: fillColor ?? KlightPallet.secondBackgroundColor,
            filled: true,
            enabled: true,
            // border: InputBorder.none,
            border: !(withLable ?? false)
                ? OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(radius ?? kBorderRadius),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(radius ?? kBorderRadius),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
          ),
          autofocus: true,
          obscureText: isPassword ?? false,
          style: const TextStyle(fontSize: 12),
          controller: controller,
          maxLength: maxLength,
          onSaved: onSaved,
          validator: validator,
          keyboardType: keyboardType,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
