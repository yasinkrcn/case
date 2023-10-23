import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:case_voco/src/core/constants/theme/app_text_style.dart';
import 'package:case_voco/src/core/extensions/sizedbox_extension.dart';
import 'package:case_voco/src/core/shared/app_image.dart';
import 'package:case_voco/src/core/shared/app_scaffold.dart';
import 'package:case_voco/src/core/shared/app_text.dart';
import 'package:case_voco/src/core/shared/app_widget_state_builder.dart';
import 'package:case_voco/src/features/home/controllers/home_state.dart';
import 'package:case_voco/src/features/home/models/user_detail_model.dart';
import 'package:case_voco/src/features/home/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: const HomeAppBar(),
      body: AppWidgetBuilderByState.none(
        response: ref.watch(userListState),
        builder: (userList) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: userList.data?.length,
            itemBuilder: (context, index) {
              UserDetailModel users = userList.data![index];
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(.7),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 7,
                  )
                ], borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppImage.circle(
                          imageUrl: users.avatar!,
                          size: 96,
                        ),
                        AppText(
                          "#${index + 1}",
                          style: AppTextStyles.style16w500.getTextStyle,
                        )
                      ],
                    ),
                    16.height,
                    AppText(
                      "First name",
                      style: AppTextStyles.style15w500Grey.getTextStyle,
                    ),
                    AppText(
                      users.firstName!,
                      style: AppTextStyles.style14w400.getTextStyle,
                    ),
                    8.height,
                    AppText(
                      "Last name",
                      style: AppTextStyles.style15w500Grey.getTextStyle,
                    ),
                    AppText(
                      users.lastName!,
                      style: AppTextStyles.style14w400.getTextStyle,
                    ),
                    8.height,
                    AppText(
                      "Email",
                      style: AppTextStyles.style15w500Grey.getTextStyle,
                    ),
                    AppText(
                      users.email!,
                      style: AppTextStyles.style14w400.getTextStyle,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
