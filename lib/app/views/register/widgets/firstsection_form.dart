import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawargi/app/widgets/base_formfield.dart';
import 'package:sawargi/app/widgets/base_forminfo.dart';

class FirstSectionForm extends StatelessWidget {
  const FirstSectionForm({
    required this.pageController,
    required this.formKey,
    required this.nikController,
    required this.dummyFindNik,
    required this.noKKController,
    required this.namaController,
    required this.noTelpController,
    required this.alamatController,
    super.key,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final TextEditingController nikController;
  final void Function(String?)? dummyFindNik;
  final TextEditingController noKKController;
  final TextEditingController namaController;
  final TextEditingController noTelpController;
  final TextEditingController alamatController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Form(
        key: formKey,
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
            BaseFormGroupField(
              label: 'NIK',
              hint: 'Masukkan NIK anda',
              controller: nikController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              onChanged: dummyFindNik,
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
              label: 'No. Telepon',
              hint: 'Masukkan no. telepon anda',
              controller: noTelpController,
              keyboardType: TextInputType.phone,
              maxLength: 13,
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan no. telepon anda';
                } else {
                  if (value.length < 11 || value.length > 13) {
                    return 'No. telepon yang anda masukkan tidak valid';
                  }
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
    );
  }
}
