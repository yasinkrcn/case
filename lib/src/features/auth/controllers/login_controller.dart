import 'package:case_voco/src/core/shared/app_scaffold.dart';
import 'package:case_voco/src/core/shared/show_custom_messenger.dart';
import 'package:case_voco/src/core/utils/modules/service_module.dart';
import 'package:case_voco/src/core/utils/route/route_manager.dart';
import 'package:case_voco/src/core/utils/route/router.dart';
import 'package:case_voco/src/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController {
  final Ref ref;
  final IAuthService _authService;

  LoginController(this.ref) : _authService = ref.read(authService);

  TextEditingController emailController = TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController = TextEditingController(text: "cityslicka");

  Future<void> login() async {
    ref.read(isLoadingState.notifier).update((state) => true);

    final result = await _authService.login(emailController.text, passwordController.text);

    result.fold((failure) => showCustomMessenger(CustomMessengerState.ERROR, failure.message), (data) {
      RouteManager.to.pageAndRemoveUntil(PageRoutes.homePage);
      showCustomMessenger(CustomMessengerState.SUCCESS, "Giriş Başarılı");

      print("data.token");
      print(data.token);
      print("data.sdtoken");
    });

    ref.read(isLoadingState.notifier).update((state) => false);
  }
}
