import 'package:case_voco/src/core/utils/ui_state.dart';
import 'package:case_voco/src/features/home/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListState = StateProvider<UIState<UserModel>>((_) => UIState.loading());
