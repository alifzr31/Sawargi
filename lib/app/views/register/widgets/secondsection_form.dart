import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/widgets/base_formfield.dart';
import 'package:sawargi/app/widgets/base_forminfo.dart';
import 'package:sawargi/app/widgets/base_iconbutton.dart';

class SecondSectionForm extends StatelessWidget {
  const SecondSectionForm({
    required this.formKey,
    required this.nikController,
    required this.passwordController,
    required this.obscurePass,
    required this.onPressedObscurePass,
    required this.passwordConfirmController,
    required this.obscurePassConfirm,
    required this.onPressedObscurePassConfirm,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nikController;
  final TextEditingController passwordController;
  final bool obscurePass;
  final void Function()? onPressedObscurePass;
  final TextEditingController passwordConfirmController;
  final bool obscurePassConfirm;
  final void Function()? onPressedObscurePassConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 2),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            BaseFormInfo(
              bgColor: Colors.blue.shade100,
              fgColor: Colors.blue.shade700,
              message: 'Buat kata sandi baru untuk akun anda',
            ),
            SizedBox(height: 10.h),
            BaseFormGroupField(
              label: 'NIK',
              hint: 'Masukkan NIK anda',
              controller: nikController,
              readOnly: true,
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
              controller: passwordController,
              obscureText: obscurePass,
              suffixIcon: BaseIconButton(
                icon:
                    obscurePass ? MingCute.eye_2_fill : MingCute.eye_close_line,
                size: 18.sp,
                color: AppColors.blueColor,
                onPressed: onPressedObscurePass,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan kata sandi anda';
                } else {
                  if (value.length < 8) {
                    return 'Kata sandi minimal berjumlah 8 karakter';
                  }
                }

                return null;
              },
            ),
            SizedBox(height: 10.h),
            BaseFormGroupField(
              label: 'Konfirmasi Kata Sandi',
              hint: 'Masukkan konfirmasi kata sandi anda',
              controller: passwordConfirmController,
              obscureText: obscurePassConfirm,
              suffixIcon: BaseIconButton(
                icon:
                    obscurePassConfirm
                        ? MingCute.eye_2_fill
                        : MingCute.eye_close_line,
                size: 18.sp,
                color: AppColors.blueColor,
                onPressed: onPressedObscurePassConfirm,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan ulang kata sandi anda';
                } else {
                  if (value != passwordController.text) {
                    return 'Kata sandi yang anda masukkan tidak sesuai';
                  }
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
