import 'package:sawargi/app/utils/app_colors.dart';
import 'package:sawargi/app/widgets/base_formfield.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDatePickerField extends StatelessWidget {
  const BaseDatePickerField({
    required this.pickerModel,
    this.hint,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.helperText,
    this.helperTextColor,
    this.onConfirmDate,
    super.key,
  });

  final picker.BasePickerModel pickerModel;
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? helperText;
  final Color? helperTextColor;
  final dynamic Function(DateTime)? onConfirmDate;

  @override
  Widget build(BuildContext context) {
    return BaseFormField(
      controller: controller,
      hint: hint,
      helperText: helperText,
      helperTextColor: helperTextColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      focusNode: focusNode,
      validator: validator,
      readOnly: true,
      onTap: () {
        picker.DatePicker.showPicker(
          context,
          pickerModel: pickerModel,
          theme: picker.DatePickerTheme(
            itemStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Plus Jakarta Sans',
            ),
            cancelStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            doneStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Plus Jakarta Sans',
              color: AppColors.blueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          locale: picker.LocaleType.id,
          onConfirm: onConfirmDate,
        );
      },
    );
  }
}

class BaseDatePickerGroupField extends StatelessWidget {
  const BaseDatePickerGroupField({
    required this.label,
    required this.pickerModel,
    this.hint,
    this.mandatory = false,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.helperText,
    this.helperTextColor,
    this.onConfirmDate,
    super.key,
  });

  final String label;
  final picker.BasePickerModel pickerModel;
  final String? hint;
  final bool mandatory;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? helperText;
  final Color? helperTextColor;
  final dynamic Function(DateTime)? onConfirmDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (mandatory)
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.shade700,
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          readOnly: true,
          onTap:
              readOnly
                  ? null
                  : () {
                    picker.DatePicker.showPicker(
                      context,
                      pickerModel: pickerModel,
                      theme: picker.DatePickerTheme(
                        itemStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                        cancelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                        doneStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Plus Jakarta Sans',
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      locale: picker.LocaleType.id,
                      onConfirm: onConfirmDate,
                    );
                  },
          cursorColor: AppColors.tealColor,
          style: TextStyle(
            fontSize: 14.sp,
            color: readOnly ? Colors.grey.shade600 : null,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
            helperText: helperText,
            helperMaxLines: 2,
            errorMaxLines: 2,
            helperStyle: TextStyle(fontSize: 10.sp, color: helperTextColor),
            errorStyle: TextStyle(fontSize: 10.sp),
            counterText: '',
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10),
            prefixIcon:
                prefixIcon == null
                    ? null
                    : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 2),
                      child: prefixIcon,
                    ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 26.r,
              minWidth: 26.r,
            ),
            suffixIcon:
                suffixIcon == null
                    ? null
                    : Padding(
                      padding: const EdgeInsets.only(left: 2, right: 10),
                      child: suffixIcon,
                    ),
            suffixIconConstraints: BoxConstraints(
              minHeight: 26.r,
              minWidth: 26.r,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyFormField),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyFormField),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyFormField),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
        ),
      ],
    );
  }
}
