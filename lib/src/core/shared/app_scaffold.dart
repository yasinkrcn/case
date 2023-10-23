import 'package:case_voco/src/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingState = StateProvider<bool>((_) => false);

class AppScaffold extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Drawer? drawer;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    Key? key,
    this.appBar,
    this.backgroundColor = AppColors.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              child: Scaffold(
                backgroundColor: backgroundColor,
                appBar: appBar ??
                    AppBar(
                      toolbarHeight: 0,
                      backgroundColor: backgroundColor,
                      elevation: 0,
                    ),
                body: body,
                drawer: drawer,
                bottomNavigationBar: bottomNavigationBar,
                floatingActionButton: floatingActionButton,
                floatingActionButtonLocation:
                    floatingActionButtonLocation ?? FloatingActionButtonLocation.miniCenterFloat,
                bottomSheet: bottomSheet,
              ),
            ),
            Visibility(
              visible: ref.watch(isLoadingState),
              child: Stack(
                children: [
                  ModalBarrier(dismissible: false, color: AppColors.black.withOpacity(.7)),
                  const Center(
                    //TODO:Eklenecek olan default gif, apilere istek gönderilen (sonuç beklenirken kullanıcının göreceği) ekranda çıkacak...
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
