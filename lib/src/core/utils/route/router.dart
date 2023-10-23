import 'package:case_voco/src/features/auth/views/pages/login_page.dart';
import 'package:case_voco/src/features/home/views/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class PageRoutes {
  //? Auth
  static const String loginPage = "/loginPage";

  //? Home
  static const String homePage = "/homePage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.loginPage:
      return CupertinoPageRoute(builder: (_) => const LoginPage());

    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());

    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}
