import 'package:case_voco/src/core/error/failure/failure.dart';
import 'package:case_voco/src/core/error/failure/network_failure.dart';
import 'package:case_voco/src/core/utils/modules/network_module.dart';
import 'package:case_voco/src/core/utils/remote_data_source/domain/entites/main_endpoints.dart';
import 'package:case_voco/src/features/home/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IHomeService {
  Future<Either<Failure, UserModel>> getUsers();
}

class HomeService implements IHomeService {
  final Ref ref;

  HomeService(this.ref);

  @override
  Future<Either<Failure, UserModel>> getUsers() async {
    try {
      final result = await ref.read(mainRequestModule).baseGet(endPoint: MainEndpoints.users, queryParameters: {
        "per_page": 12,
      });

      return result.fold((failure) => Left(failure), (jsonData) {
        UserModel data = UserModel.fromJson(jsonData);

        return Right(data);
      });
    } catch (exception) {
      return Left(NotFoundFailure());
    }
  }
}
