import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/views/register/components/registerform_header.dart';
import 'package:sawargi/app/views/register/widgets/firstsection_form.dart';
import 'package:sawargi/app/views/register/widgets/secondsection_form.dart';
import 'package:sawargi/app/widgets/base_button.dart';
import 'package:sawargi/app/widgets/show_customtoast.dart';
import 'package:toastification/toastification.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _firstFormKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _noKKController = TextEditingController();
  final _namaController = TextEditingController();
  final _noTelpController = TextEditingController();
  final _alamatController = TextEditingController();

  final _secondFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool obscurePass = true;
  final _passwordConfirmController = TextEditingController();
  bool obscurePassConfirm = true;

  void _dummyFindNik(String? value) async {
    if (value!.length == 16) {
      context.loaderOverlay.show();

      await Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          if (_nikController.text == '1234567890123456') {
            _noKKController.text = '6543210123456789';
            _namaController.text = 'Alif Zakya Rafiq';
            _noTelpController.text = '081221112586';
            _alamatController.text =
                'Blok Citopeng No. 327 RT 06 RW 22, Kelurahan Melong, Kecamatan Cimahi Selatan, Kota Cimahi, Jawa Barat, Indonesia 40534';
          } else {
            _noKKController.clear();
            _namaController.clear();
            _noTelpController.clear();
            _alamatController.clear();
            showCustomToast(
              context,
              type: ToastificationType.error,
              title: 'NIK Tidak Ditemukan',
              description:
                  'Mohon maaf data penduduk dengan NIK ${_nikController.text} tidak ditemukan',
            );
          }

          context.loaderOverlay.hide();
        }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nikController.dispose();
    _noKKController.dispose();
    _namaController.dispose();
    _noTelpController.dispose();
    _alamatController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (_currentPage == 0) {
          context.pop();
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          );
        }
      },
      child: Expanded(
        child: Material(
          color: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10.r),
          child: Column(
            children: [
              RegisterFormHeader(
                currentPage: _currentPage,
                pageController: _pageController,
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    FirstSectionForm(
                      pageController: _pageController,
                      formKey: _firstFormKey,
                      nikController: _nikController,
                      dummyFindNik: _dummyFindNik,
                      noKKController: _noKKController,
                      namaController: _namaController,
                      noTelpController: _noTelpController,
                      alamatController: _alamatController,
                    ),
                    SecondSectionForm(
                      formKey: _secondFormKey,
                      nikController: _nikController,
                      passwordController: _passwordController,
                      obscurePass: obscurePass,
                      onPressedObscurePass: () {
                        setState(() {
                          obscurePass = !obscurePass;
                        });
                      },
                      passwordConfirmController: _passwordConfirmController,
                      obscurePassConfirm: obscurePassConfirm,
                      onPressedObscurePassConfirm: () {
                        setState(() {
                          obscurePassConfirm = !obscurePassConfirm;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SizedBox(
                  height: 35.h,
                  width: double.infinity,
                  child:
                      _currentPage == 0
                          ? BaseButtonIcon(
                            bgColor: AppColors.amberColor,
                            fgColor: Colors.white,
                            label: 'Lanjut',
                            icon: MingCute.arrow_right_line,
                            onPressed: () {
                              if (_firstFormKey.currentState?.validate() ??
                                  false) {
                                _pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubic,
                                );
                              }
                            },
                          )
                          : BaseButton(
                            bgColor: AppColors.amberColor,
                            fgColor: Colors.white,
                            label: 'Daftar',
                            onPressed: () async {
                              if (_secondFormKey.currentState?.validate() ??
                                  false) {
                                context.loaderOverlay.show();

                                await Future.delayed(
                                  const Duration(milliseconds: 1500),
                                  () {
                                    if (context.mounted) {
                                      context.loaderOverlay.hide();
                                      context.pop();
                                      showCustomToast(
                                        context,
                                        type: ToastificationType.success,
                                        title: 'Daftar Berhasil',
                                        description:
                                            'Akun anda berhasil didaftarkan, silahkan masuk dengan NIK dan kata sandi yang sudah anda daftarkan',
                                      );
                                    }
                                  },
                                );
                              }
                            },
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
