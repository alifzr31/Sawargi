import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/utils/app_strings.dart';
import 'package:sawargi/app/views/register/register_page.dart';
import 'package:sawargi/app/widgets/base_button.dart';
import 'package:sawargi/app/widgets/base_formfield.dart';
import 'package:sawargi/app/widgets/base_iconbutton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    _nikController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('${AppStrings.assetsImages}/logo.svg', width: 44.w),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Tolong masuk untuk melanjutkan',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          BaseFormGroupField(
            label: 'NIK',
            hint: 'Masukkan NIK anda',
            controller: _nikController,
            keyboardType: TextInputType.number,
            maxLength: 16,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Silahkan masukkan NIK anda';
              } else {
                if (value.length < 16 || value.length > 16) {
                  return 'NIK yang anda masukkan tidak valid';
                }
              }

              return null;
            },
          ),
          SizedBox(height: 10.h),
          BaseFormGroupField(
            label: 'Kata Sandi',
            hint: 'Masukkan kata sandi anda',
            obscureText: _obscurePass,
            suffixIcon: BaseIconButton(
              icon:
                  _obscurePass ? MingCute.eye_2_fill : MingCute.eye_close_line,
              size: 18.sp,
              color: AppColors.blueColor,
              onPressed: () {
                setState(() {
                  _obscurePass = !_obscurePass;
                });
              },
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Silahkan masukkan kata sandi anda';
              }

              return null;
            },
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: BaseButton(
              bgColor: AppColors.tealColor,
              fgColor: Colors.white,
              label: 'Masuk',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {}
              },
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(child: Divider(height: 1, color: Colors.grey.shade300)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'atau',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Expanded(child: Divider(height: 1, color: Colors.grey.shade300)),
            ],
          ),
          SizedBox(height: 6.h),
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: BaseOutlineButton(
              borderColor: AppColors.amberColor,
              fgColor: AppColors.amberColor,
              label: 'Daftar Sekarang',
              onPressed: () {
                context.push(RegisterPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
