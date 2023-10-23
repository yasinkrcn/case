import 'package:case_voco/src/features/auth/services/auth_service.dart';
import 'package:case_voco/src/features/home/services/home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> serviceModule() async {
  authService = Provider((ref) => AuthService(ref));
  homeService = Provider((ref) => HomeService(ref));
}

late final Provider<IAuthService> authService;
late final Provider<IHomeService> homeService;
