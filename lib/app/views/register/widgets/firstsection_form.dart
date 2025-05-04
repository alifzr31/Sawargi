import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawargi/app/cubits/auth/auth_cubit.dart';
import 'package:sawargi/app/models/anggota_kependudukan.dart';
import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/utils/string_extension.dart';
import 'package:sawargi/app/widgets/base_datepickerfield.dart';
import 'package:sawargi/app/widgets/base_formfield.dart';
import 'package:sawargi/app/widgets/base_forminfo.dart';

class FirstSectionForm extends StatelessWidget {
  const FirstSectionForm({
    required this.pageController,
    required this.formKey,
    required this.nikController,
    required this.findNik,
    required this.nikListener,
    required this.noKKController,
    required this.namaController,
    required this.listJk,
    required this.selectedJk,
    required this.showJkValidate,
    // required this.onSelectedJk,
    required this.tempatLahirController,
    required this.tglLahirController,
    required this.selectedTglLahir,
    required this.alamatController,
    super.key,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final TextEditingController nikController;
  final void Function(AnggotaKependudukan?) findNik;
  final void Function(BuildContext, AuthState) nikListener;
  final TextEditingController noKKController;
  final TextEditingController namaController;
  final List<String> listJk;
  final String? selectedJk;
  final bool showJkValidate;
  // final void Function(String) onSelectedJk;
  final TextEditingController tempatLahirController;
  final TextEditingController tglLahirController;
  final DateTime? selectedTglLahir;
  final TextEditingController alamatController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 2),
      child: Form(
        key: formKey,
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              BaseFormInfo(
                bgColor: Colors.blue.shade100,
                fgColor: Colors.blue.shade700,
                message:
                    'Anda hanya perlu memasukkan NIK anda maka seluruh kolom sisanya akan otomatis terisi',
              ),
              SizedBox(height: 10.h),
              BlocListener<AuthCubit, AuthState>(
                listenWhen:
                    (previous, current) =>
                        previous.nikStatus != current.nikStatus,
                listener: nikListener,
                child: BaseFormGroupField(
                  label: 'NIK',
                  hint: 'Masukkan NIK anda',
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  onChanged: (value) {
                    if (value?.length == 16) {
                      context.read<AuthCubit>().checkAnggotaKependudukanByNik(
                        nik: value,
                      );
                    }
                  },
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
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Jenis Kelamin',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Column(
                children: List.generate(listJk.length, (index) {
                  final jk = listJk[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: index == 1 ? 0 : 4),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 22,
                      onPressed: null,
                      // onPressed: () => onSelectedJk(jk),
                      child: Row(
                        children: [
                          Container(
                            height: 10.r,
                            width: 10.r,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueColor),
                              shape: BoxShape.circle,
                            ),
                            child:
                                selectedJk == jk
                                    ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.blueColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                    : null,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            jk.capitalize(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Plus Jakarta Sans',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              if (showJkValidate) ...{
                SizedBox(height: 2.h),
                Text(
                  'Silahkan pilih jenis kelamin anda',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              },
              SizedBox(height: 10.h),
              BaseFormGroupField(
                label: 'No. Kartu Keluarga',
                hint: 'Masukkan no. kartu keluarga anda',
                controller: noKKController,
                readOnly: true,
                keyboardType: TextInputType.number,
                maxLength: 16,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan masukkan no. kartu keluarga anda';
                  } else {
                    if (value.length < 16 || value.length > 16) {
                      return 'No. kartu keluarga yang anda masukkan tidak valid';
                    }
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.h),
              BaseFormGroupField(
                label: 'Nama Lengkap',
                hint: 'Masukkan nama lengkap anda',
                controller: namaController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan masukkan nama lengkap anda';
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.h),
              BaseFormGroupField(
                label: 'Tempat Lahir',
                hint: 'Masukkan tempat lahir anda',
                controller: tempatLahirController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan masukkan tempat lahir anda';
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.h),
              BaseDatePickerGroupField(
                label: 'Tanggal Lahir',
                hint: 'Pilih tanggal lahir anda',
                controller: tglLahirController,
                readOnly: true,
                pickerModel: DatePickerModel(
                  currentTime: selectedTglLahir ?? DateTime.now(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan pilih tanggal lahir anda';
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.h),
              BaseFormGroupField(
                label: 'Alamat',
                hint: 'Masukkan alamat anda',
                controller: alamatController,
                maxLines: null,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan masukkan alamat anda';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
