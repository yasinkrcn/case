import 'package:case_voco/src/core/utils/modules/service_module.dart';
import 'package:case_voco/src/core/utils/ui_state.dart';
import 'package:case_voco/src/features/home/models/user_model.dart';
import 'package:case_voco/src/features/home/services/home_service.dart';
import 'package:case_voco/src/features/home/controllers/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController {
  final Ref ref;
  final IHomeService _homeService;

  HomeController(this.ref) : _homeService = ref.read(homeService);

  Future<void> fetchUsers() async {
    final result = await _homeService.getUsers();
    UIState<UserModel> users = UIState.idle();
    result.fold((failure) {
      ref.read(userListState.notifier).update((state) => UIState.error(failure));
    }, (data) async {
      users = UIState.success(data);
    });

    ref.read(userListState.notifier).update((_) => users);
  }
}
