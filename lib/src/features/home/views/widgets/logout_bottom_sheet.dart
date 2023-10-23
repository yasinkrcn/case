import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:case_voco/src/core/constants/theme/app_text_style.dart';
import 'package:case_voco/src/core/extensions/sizedbox_extension.dart';
import 'package:case_voco/src/core/shared/app_button.dart';
import 'package:case_voco/src/core/shared/app_text.dart';
import 'package:case_voco/src/core/utils/modules/controller_module.dart';
import 'package:case_voco/src/core/utils/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutBottomSheet extends ConsumerWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText("Do you want to exit the application?",
              style: AppTextStyles.style16w500.getTextStyle.copyWith(color: AppColors.grey)),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton.standart(
                width: 100,
                buttonText: "Yes",
                onTap: () {
                  ref.read(loginController).logOut();
                },
              ),
              AppButton.outline(
                width: 100,
                buttonText: "No",
                onTap: () => RouteManager.to.back(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
