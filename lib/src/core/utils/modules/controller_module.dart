import 'package:case_voco/src/features/auth/controllers/login_controller.dart';
import 'package:case_voco/src/features/home/controllers/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> controllerModule() async {
  loginController = Provider.autoDispose((ref) => LoginController(ref));
  // homeController = Provider.autoDispose((ref) => HomeController(ref));
}

late final AutoDisposeProvider<LoginController> loginController;
// late final AutoDisposeProvider<HomeController> homeController;
