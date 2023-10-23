import 'package:case_voco/src/core/constants/app_constants.dart';
import 'package:case_voco/src/core/constants/theme/app_theme.dart';
import 'package:case_voco/src/core/keys/global_key.dart';
import 'package:case_voco/src/core/utils/modules/controller_module.dart';
import 'package:case_voco/src/core/utils/modules/network_module.dart';
import 'package:case_voco/src/core/utils/modules/service_module.dart';
import 'package:case_voco/src/core/utils/route/router.dart';
import 'package:case_voco/src/features/auth/views/pages/login_page.dart';
import 'package:case_voco/src/features/home/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Future.wait([
    networkModule(),
    serviceModule(),
    controllerModule(),
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      navigatorKey: GlobalContextKey.instance.globalKey,
      onGenerateRoute: generateRoute,
      home: LoginPage(),
    );
  }
}
