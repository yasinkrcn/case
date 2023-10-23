import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:case_voco/src/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

enum AppTextStyles {
  style16w500,
  style15w500Grey,
  style16w600,
  style24w600,
  style14w400,
}

extension AppTextStylesExtension on AppTextStyles {
  TextStyle get getTextStyle {
    switch (this) {
      case AppTextStyles.style16w500:
        return TextStyle(
          fontSize: 16.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
      case AppTextStyles.style16w600:
        return TextStyle(
          fontSize: 16.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
      case AppTextStyles.style15w500Grey:
        return TextStyle(
          fontSize: 15.sp,
          height: 1.2,
          color: AppColors.grey,
          fontWeight: FontWeight.w500,
        );
      case AppTextStyles.style24w600:
        return TextStyle(
          fontSize: 24.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
      case AppTextStyles.style14w400:
        return TextStyle(
          fontSize: 14.sp,
          height: 1.2,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    }
  }
}
