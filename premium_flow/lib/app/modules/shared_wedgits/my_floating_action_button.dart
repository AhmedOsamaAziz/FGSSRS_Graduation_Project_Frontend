import 'package:flutter/material.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: 20,
      height: 40,
      child: FloatingActionButton(
        onPressed: () {},
        // child: RawMaterialButton(
        //   shape: const CircleBorder(),
        //   elevation: 0.0,
        //   onPressed: () {},
        //   child: child,
        // ),
        child: child,
      ),
    );
  }
}
