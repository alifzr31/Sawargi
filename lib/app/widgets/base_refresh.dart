import 'package:flutter/material.dart';
import 'package:sawargi/app/utils/app_colors.dart';

class BaseRefresh extends StatelessWidget {
  const BaseRefresh({required this.onRefresh, required this.child, super.key});

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      color: AppColors.tealColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
