// import 'package:case_voco/src/core/error/failure/failure.dart';
// import 'package:case_voco/src/core/error/failure/network_failure.dart';
// import 'package:case_voco/src/core/utils/network/main_endpoints.dart';
// import 'package:case_voco/src/features/home/models/user_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class HomeService {
//   final Dio _dio;

//   HomeService(this._dio);

//   Future<Either<Failure, UserModel>> getUsers() async {
//     final response = await _dio.get(MainEndpoints.users, queryParameters: {
//       "per_page": 12,
//     });

//     if (response.statusCode == 200) {
//       UserModel data = UserModel.fromJson(response.data);

//       return Right(data);
//     } else {
//       return Left(UnauthorizedFailure());
//     }
//   }
// }
