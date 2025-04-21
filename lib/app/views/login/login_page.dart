import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawargi/app/views/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.white,
                    elevation: 1,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10.r),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: LoginForm(),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Sawargi v1.0.0',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
