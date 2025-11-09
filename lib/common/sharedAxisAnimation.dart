import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';

class SharedAxisCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,                // make it nullable
      Alignment? alignment,        // make it nullable
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.vertical, // or .vertical / .scaled
      child: child,
    );
  }
}

class SharedAxisContentWrapper extends StatelessWidget {
  final Widget child;

  const SharedAxisContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 1000),
      transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
          ) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical, // 👈 Content slides vertically
          child: child,
          fillColor: Colors.transparent,
        );
      },
      child: child,
    );
  }
}
