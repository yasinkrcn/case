import 'package:case_voco/src/features/auth/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> serviceModule() async {
  authService = Provider((ref) => AuthService(ref));
}

late final Provider<IAuthService> authService;
