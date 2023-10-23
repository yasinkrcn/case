import 'package:case_voco/src/core/constants/asset_paths.dart';
import 'package:case_voco/src/core/extensions/sizedbox_extension.dart';
import 'package:case_voco/src/core/shared/app_scaffold.dart';
import 'package:case_voco/src/core/utils/modules/controller_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    ref.read(loginController).readTokenToLocal();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Image.asset(AssetPaths().loginPNG),
          ),
          48.height,
          const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
