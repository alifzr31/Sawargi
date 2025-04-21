import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/utils/app_strings.dart';

class RegisterFormHeader extends StatelessWidget {
  const RegisterFormHeader({
    required this.currentPage,
    required this.pageController,
    super.key,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          SvgPicture.asset('${AppStrings.assetsImages}/logo.svg', width: 44.w),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Sekarang!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Tolong lengkapi untuk mendaftar',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.tealColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.grey.shade400,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                      height: 10,
                      width: currentPage == 0 ? 0 : ScreenUtil().screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.tealColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (currentPage == 1) ...{
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                minSize: 23,
                padding: EdgeInsets.zero,
                onPressed:
                    currentPage == 0
                        ? null
                        : () {
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      MingCute.arrow_left_line,
                      size: 12.sp,
                      color: AppColors.blueColor,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Plus Jakarta Sans',
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}
