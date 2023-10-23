import 'package:case_voco/src/core/shared/app_scaffold.dart';
import 'package:case_voco/src/core/shared/show_custom_messenger.dart';
import 'package:case_voco/src/core/utils/local_data_source/shared_pref_keys.dart';
import 'package:case_voco/src/core/utils/local_data_source/shared_pref_manager.dart';
import 'package:case_voco/src/core/utils/modules/controller_module.dart';
import 'package:case_voco/src/core/utils/modules/service_module.dart';
import 'package:case_voco/src/core/utils/route/route_manager.dart';
import 'package:case_voco/src/core/utils/route/router.dart';
import 'package:case_voco/src/features/auth/controllers/login_state.dart';
import 'package:case_voco/src/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController {
  final Ref ref;
  final IAuthService _authService;
  SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager();

  LoginController(this.ref) : _authService = ref.read(authService);

  TextEditingController emailController = TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController = TextEditingController(text: "cityslicka");

  Future<void> login() async {
    ref.read(isLoadingState.notifier).update((state) => true);

    final result = await _authService.login(emailController.text, passwordController.text);

    result.fold((failure) => showCustomMessenger(CustomMessengerState.ERROR, failure.message), (data) async {
      await saveTokenToLocal(data.token!);

      ref.read(token.notifier).update((state) => data.token!);

      RouteManager.to.pageAndRemoveUntil(PageRoutes.homePage);
      showCustomMessenger(CustomMessengerState.SUCCESS, "Giriş Başarılı");
    });

    ref.read(isLoadingState.notifier).update((state) => false);
  }

  Future<void> saveTokenToLocal(String token) async {
    await sharedPreferencesManager.write(SharedPreferencesKeys.CACHE_USER_TOKEN, token);
  }

  Future<void> readTokenToLocal() async {
    var result = await sharedPreferencesManager.read(
      SharedPreferencesKeys.CACHE_USER_TOKEN,
    );

    await Future.delayed(const Duration(seconds: 2));

    if (result != null) {
      // tokenı riverpod ile kaydediyoruz ve uygulama boyunca erişilebilir oluyor :)
      ref.read(token.notifier).update((state) => result);
      ref.read(homeController).fetchUsers();
      RouteManager.to.pageAndRemoveUntil(PageRoutes.homePage);
    } else {
      RouteManager.to.pageAndRemoveUntil(PageRoutes.loginPage);
    }
  }

  Future<void> deleteTokenToLocal() async {
    await sharedPreferencesManager.delete(
      SharedPreferencesKeys.CACHE_USER_TOKEN,
    );
  }

  void logOut() {
    if (ref.read(token) != "") {
      try {
        deleteTokenToLocal();
        RouteManager.to.pageAndRemoveUntil(PageRoutes.loginPage);
        showCustomMessenger(CustomMessengerState.INFO, "Exit successful");
      } catch (_) {
        showCustomMessenger(CustomMessengerState.ERROR, "Error");
      }
    }
  }
}
