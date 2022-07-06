import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';

class MyDropdown<T> extends StatelessWidget {
  const MyDropdown(
      {super.key,
      this.items,
      this.isExpanded,
      this.value,
      this.onChanged,
      this.radius,
      this.fillColor,
      this.hint,
      this.icon});

  final List<DropdownMenuItem<T>>? items;
  final bool? isExpanded;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final double? radius;
  final Color? fillColor;
  final Widget? hint;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: fillColor ??
              KlightPallet
                  .secondBackgroundColor, //background color of dropdown button
          // border: Border.all(
          //     color: Colors.black38, width: 3), //border of dropdown button
          borderRadius: BorderRadius.circular(radius ?? kBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: DropdownButton<T>(
            style: const TextStyle(fontSize: 12),
            items: items,
            borderRadius: BorderRadius.circular(radius ?? kBorderRadius),
            onChanged: onChanged,
            isExpanded: isExpanded ?? true,
            value: value,
            enableFeedback: true,
            hint: hint,
            icon: icon,
          ),
        ),
      ),
    );
  }
}
