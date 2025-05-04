import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/views/dashboard/components/bottomnav_item.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({
    required this.items,
    required this.activeIndex,
    required this.onTap,
    super.key,
  });

  final List<BottomNavItem> items;
  final int activeIndex;
  final dynamic Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      gapLocation: GapLocation.none,
      splashColor: AppColors.tealColor,
      scaleFactor: 0.2,
      activeIndex: activeIndex,
      onTap: onTap,
      itemCount: 4,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              items[index].icon,
              size: isActive ? 22.sp : 20.sp,
              color: isActive ? AppColors.blueColor : Colors.grey.shade400,
            ),
            Text(
              items[index].label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isActive ? FontWeight.w600 : null,
                color: isActive ? AppColors.blueColor : Colors.grey.shade400,
              ),
            ),
          ],
        );
      },
    );
  }
}
