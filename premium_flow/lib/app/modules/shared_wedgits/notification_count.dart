import 'package:flutter/material.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';

class NotificationCount extends StatelessWidget {
  const NotificationCount({
    Key? key,
    this.count,
  }) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (count ?? 0) > 0 ? true : false,
      child: Container(
        width: 25,
        height: 20,
        decoration: const BoxDecoration(
          color: KlightPallet.notificationColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            ((count ?? 0) >= 100) ? '99+' : "$count",
            style: const TextStyle(
                color: KlightPallet.notificationFontColor,
                fontSize: 9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
