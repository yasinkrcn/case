import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:case_voco/src/core/constants/theme/app_text_style.dart';
import 'package:case_voco/src/core/shared/app_text.dart';
import 'package:case_voco/src/features/home/views/widgets/logout_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        "Users",
        style: AppTextStyles.style16w500.getTextStyle.copyWith(color: AppColors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      actions: [
        InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const LogOutBottomSheet();
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.exit_to_app,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
