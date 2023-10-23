import 'package:case_voco/src/core/error/failure/failure.dart';
import 'package:case_voco/src/core/error/failure/network_failure.dart';
import 'package:case_voco/src/core/utils/modules/network_module.dart';
import 'package:case_voco/src/core/utils/remote_data_source/domain/entites/main_endpoints.dart';
import 'package:case_voco/src/features/auth/models/token_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAuthService {
  Future<Either<Failure, TokenModel>> login(String email, String password);
}

class AuthService implements IAuthService {
  final Ref ref;

  AuthService(this.ref);

  @override
  Future<Either<Failure, TokenModel>> login(String email, String password) async {
    try {
      final result = await ref.read(mainRequestModule).basePost(
          endPoint: MainEndpoints.login, requestBody: <String, dynamic>{'email': email, 'password': password});

      return result.fold((failure) => Left(failure), (jsonData) {
        TokenModel data = TokenModel.fromJson(jsonData);

        return Right(data);
      });
    } catch (exception) {
      return Left(NotFoundFailure());
    }
  }
}
