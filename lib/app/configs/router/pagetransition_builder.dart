import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageTransition<dynamic> pageTransitionBuilder(
  BuildContext context, {
  PageTransitionType type = PageTransitionType.fade,
  required Widget child,
}) {
  return PageTransition(
    type: type,
    childCurrent: context.currentRoute,
    curve: Curves.easeInOutCubic,
    duration: const Duration(milliseconds: 300),
    reverseDuration: const Duration(milliseconds: 300),
    child: child,
  );
}
