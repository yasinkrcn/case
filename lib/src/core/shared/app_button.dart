import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:case_voco/src/core/constants/theme/app_text_style.dart';
import 'package:case_voco/src/core/extensions/num_extension.dart';
import 'package:case_voco/src/core/extensions/sizedbox_extension.dart';
import 'package:case_voco/src/core/shared/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final Color backGroundColor;
  final TextStyle? style;

  final String? iconPath;
  final double? width;
  final double? height;
  late final BoxBorder? _border;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;

  final double? iconWidth;
  final double? iconHeight;
  final Color? textColor;

  AppButton._({
    Key? key,
    this.onTap,
    this.iconPath,
    BoxBorder? border,
    this.width,
    this.style,
    this.height = 56,
    required this.buttonText,
    required this.backGroundColor,
    this.textColor,
    this.borderRadius,
    this.boxShadow,
    this.iconWidth,
    this.iconHeight,
  }) : super(key: key) {
    _border = border;
  }

  factory AppButton.standart({
    required Function() onTap,
    required String buttonText,
    bool isActive = true,
    color,
    BorderRadiusGeometry? borderRadius,
    Color? textColor,
    double? width,
    double? height,
  }) {
    Color backgroundColor = AppColors.primaryColor;
    Color textColor = Colors.white;

    if (!isActive) {
      backgroundColor = AppColors.secondaryColor;
      textColor = AppColors.primaryColor;
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      backGroundColor: color ?? backgroundColor,
      textColor: textColor,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      width: width,
      height: height,
    );
  }

  factory AppButton.icon({
    required Function() onTap,
    required String iconPath,
    String? buttonText,
    Color? textColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? top,
    double? bottom,
    List<BoxShadow>? boxShadow,
    double? height,
    style,
    double? iconWidth,
    double? iconHeight,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.white;

    Color incomingTextColor = textColor ?? AppColors.black;

    boxShadow = [
      BoxShadow(
        color: const Color(0xFFD9D9D9).withOpacity(.65),
        blurRadius: 20,
        blurStyle: BlurStyle.outer,
      ),
    ];

    if (!isActive) {
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      iconPath: iconPath,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      width: width,
      boxShadow: boxShadow,
      height: height,
      style: style,
      iconWidth: iconWidth,
      iconHeight: iconHeight,
    );
  }

  factory AppButton.outline({
    Function()? onTap,
    String? buttonText,
    Color? textColor,
    Color? borderColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
    double? height,
    style,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.white;
    Color incomingBorderColor = borderColor ?? AppColors.primaryColor;
    Color incomingTextColor = textColor ?? AppColors.primaryColor;

    if (!isActive) {
      incomingBorderColor = AppColors.primaryColor.withOpacity(.6);
      incomingTextColor = AppColors.primaryColor.withOpacity(.6);
      incomingBackgroundColor = AppColors.white;
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      border: Border.all(color: incomingBorderColor),
      height: height,
      width: width,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48.h,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          border: _border,
          color: backGroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              Image.asset(
                iconPath ?? '',
                height: iconHeight ?? 36,
              ),
              8.width
            ],
            if (buttonText != null) ...[
              AppText(buttonText ?? "",
                  style: style ?? AppTextStyles.style16w500.getTextStyle.copyWith(color: textColor)),
            ],
          ],
        ),
      ),
    );
  }
}
