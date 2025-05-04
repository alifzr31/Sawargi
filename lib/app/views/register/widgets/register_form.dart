import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sawargi/app/cubits/auth/auth_cubit.dart';
import 'package:sawargi/app/models/anggota_kependudukan.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/utils/app_helpers.dart';
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
  final listJk = const ['laki-laki', 'perempuan'];
  String? selectedJk;
  bool showJkValidate = false;
  final _tempatLahirController = TextEditingController();
  final _tglLahirController = TextEditingController();
  DateTime? selectedTglLahir;
  String? selectedTglLahirString;
  final _alamatController = TextEditingController();
  final _secondFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool obscurePass = true;
  final _passwordConfirmController = TextEditingController();
  bool obscurePassConfirm = true;

  void _findNik(AnggotaKependudukan? anggotaKependudukan) async {
    if (anggotaKependudukan != null) {
      _noKKController.text = anggotaKependudukan.nomorKk ?? '';
      _namaController.text = anggotaKependudukan.nama ?? '';
      setState(() {
        selectedJk = anggotaKependudukan.jenisKelamin?.toLowerCase();
        showJkValidate = false;
        selectedTglLahirString = AppHelpers.databaseDateFormat(
          anggotaKependudukan.tanggalLahir ?? DateTime(0000),
        );
        selectedTglLahir = DateFormat(
          'yyyy-MM-dd',
        ).parse(selectedTglLahirString ?? '');
      });
      _tempatLahirController.text = anggotaKependudukan.tempatLahir ?? '';
      _tglLahirController.text = AppHelpers.dayMonthYearFormat(
        anggotaKependudukan.tanggalLahir ?? DateTime(0000),
      );
      _alamatController.text = anggotaKependudukan.alamat ?? '';
      _firstFormKey.currentState?.validate();
    } else {
      _noKKController.clear();
      _namaController.clear();
      setState(() {
        selectedJk = null;
        showJkValidate = false;
        selectedTglLahirString = null;
        selectedTglLahir = null;
      });
      _tempatLahirController.clear();
      _tglLahirController.clear();
      _alamatController.clear();
      showCustomToast(
        context,
        type: ToastificationType.error,
        title: 'NIK Tidak Ditemukan',
        description: context.read<AuthCubit>().state.nikError,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nikController.dispose();
    _noKKController.dispose();
    _namaController.dispose();
    _tempatLahirController.dispose();
    _tglLahirController.dispose();
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
        if (!didPop) {
          if (_currentPage == 0) {
            Navigator.pop(context);
            context.read<AuthCubit>().resetRegisterState();
          } else {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
            );
          }
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
                      findNik: _findNik,
                      nikListener: (context, state) {
                        if (state.nikStatus == NikStatus.loading) {
                          context.loaderOverlay.show();
                        }

                        if (state.nikStatus == NikStatus.success) {
                          context.loaderOverlay.hide();
                          _findNik(state.anggotaKependudukan);
                        }

                        if (state.nikStatus == NikStatus.error) {
                          context.loaderOverlay.hide();
                          showCustomToast(
                            context,
                            type: ToastificationType.error,
                            title: 'NIK Tidak Ditemukan',
                            description: state.nikError,
                          );
                        }
                      },
                      noKKController: _noKKController,
                      namaController: _namaController,
                      listJk: listJk,
                      selectedJk: selectedJk,
                      showJkValidate: showJkValidate,
                      tglLahirController: _tglLahirController,
                      tempatLahirController: _tempatLahirController,
                      selectedTglLahir: selectedTglLahir,
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
                              setState(() {
                                showJkValidate =
                                    selectedJk == null ? true : false;
                              });

                              if (_firstFormKey.currentState?.validate() ??
                                  false) {
                                if (selectedJk != null) {
                                  _pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                  );
                                }
                              }
                            },
                          )
                          : BlocListener<AuthCubit, AuthState>(
                            listenWhen:
                                (previous, current) =>
                                    previous.registerStatus !=
                                    current.registerStatus,
                            listener: (context, state) {
                              if (state.registerStatus ==
                                  RegisterStatus.loading) {
                                context.loaderOverlay.show();
                              }

                              if (state.registerStatus ==
                                  RegisterStatus.success) {
                                context.loaderOverlay.hide();
                                Navigator.pop(context);
                                context.read<AuthCubit>().resetRegisterState();
                                showCustomToast(
                                  context,
                                  type: ToastificationType.success,
                                  title: 'Daftar Berhasil',
                                  description:
                                      state.registerResponse.toString(),
                                );
                              }

                              if (state.registerStatus ==
                                  RegisterStatus.error) {
                                context.loaderOverlay.hide();
                                showCustomToast(
                                  context,
                                  type: ToastificationType.error,
                                  title: 'Daftar Gagal',
                                  description: state.registerError,
                                );
                              }
                            },
                            child: BaseButton(
                              bgColor: AppColors.amberColor,
                              fgColor: Colors.white,
                              label: 'Daftar',
                              onPressed: () async {
                                if (_secondFormKey.currentState?.validate() ??
                                    false) {
                                  context.read<AuthCubit>().register(
                                    nik: _nikController.text,
                                    name: _namaController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
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
