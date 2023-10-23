// import 'package:case_voco/src/core/error/failure/failure.dart';
// import 'package:case_voco/src/core/utils/modules/network_module.dart';
// import 'package:case_voco/src/core/utils/network/api_request.dart';
// import 'package:case_voco/src/core/utils/ui_state.dart';
// import 'package:case_voco/src/features/home/models/user_model.dart';
// import 'package:case_voco/src/features/home/services/home_service.dart';
// import 'package:case_voco/src/features/home/controllers/home_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomeController {
//   final Ref ref;
//   final HomeService _homeService;

//   HomeController(this.ref) : _homeService = ref.read(homeService) {
//     // fetchUsers();
//   }

//   Future<void> fetchUsers() async {
//     ref.read(userListState.notifier).update((_) => UIState.loading());
//     var response = await _homeService.getUsers();

//     UIState<UserModel> users = UIState.idle();

//     response.fold((failure) {
//       users = UIState.error(ServiceFailure());
//     }, (data) {
//       users = UIState.success(data);
//     });

//     ref.read(userListState.notifier).update((_) => users);
//   }
// }
