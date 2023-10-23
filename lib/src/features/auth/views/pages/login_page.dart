import 'package:case_voco/src/core/constants/asset_paths.dart';
import 'package:case_voco/src/core/extensions/sizedbox_extension.dart';
import 'package:case_voco/src/core/shared/app_button.dart';
import 'package:case_voco/src/core/shared/app_scaffold.dart';
import 'package:case_voco/src/core/shared/app_text.dart';
import 'package:case_voco/src/core/shared/app_text_form_field.dart';
import 'package:case_voco/src/core/utils/modules/controller_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetPaths().loginPNG),
              AppText("Email"),
              8.height,
              AppTextFormField.standart(
                hintText: "Email",
                controller: ref.watch(loginController).emailController,
              ),
              8.height,
              AppText("Password"),
              8.height,
              AppTextFormField.obscure(
                hintText: "Password",
                controller: ref.watch(loginController).passwordController,
              ),
              16.height,
              AppButton.standart(
                onTap: () => ref.read(loginController).login(),
                buttonText: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
