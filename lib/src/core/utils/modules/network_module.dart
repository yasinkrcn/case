import 'package:case_voco/src/core/utils/remote_data_source/data/repository/network_manager.dart';
import 'package:case_voco/src/core/utils/remote_data_source/dio_manager.dart';
import 'package:case_voco/src/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> networkModule() async {
  mainRequestModule = Provider((ref) => NetworkManager(DioManager.getDio()));
}

late final Provider<INetworkManager> mainRequestModule;
