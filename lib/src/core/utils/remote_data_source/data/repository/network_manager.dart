import 'dart:convert';
import 'dart:io';
import 'package:case_voco/src/core/entities/error_response_model.dart';
import 'package:case_voco/src/core/error/failure/failure.dart';
import 'package:case_voco/src/core/error/failure/network_failure.dart';
import 'package:case_voco/src/core/utils/remote_data_source/domain/entites/main_endpoints.dart';
import 'package:case_voco/src/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NetworkManager extends INetworkManager {
  NetworkManager(super.dio);

  @override
  Future<Either<Failure, String>> baseGet(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    return await _errorHandler(
      dio.get(
        endPoint.path,
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future<Either<Failure, String>> basePost({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
    FormData? formData,
  }) async {
    return await _errorHandler(
      dio.post(
        endPoint.path,
        queryParameters: queryParameters,
        data: formData ?? jsonEncode(requestBody),
      ),
    );
  }

  @override
  Future<Either<Failure, String>> baseDelete(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    return await _errorHandler(
      dio.delete(
        endPoint.path,
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future<Either<Failure, String>> basePut(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    return await _errorHandler(
      dio.put(
        endPoint.path,
        queryParameters: queryParameters,
        data: jsonEncode(requestBody),
      ),
    );
  }

  Future<Either<Failure, String>> _errorHandler(Future<Response> requestFunction) async {
    Response response;
    try {
      response = await requestFunction;
    } on SocketException {
      return Left(NoInternetConnectionFailure());
    }

    return _handleResponse(response);
  }

  Either<Failure, String> _handleResponse(Response response) {
    Failure result = ServiceFailure();
    result.errorText = ErrorResponseModel.fromJson(response.data).error;
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.accepted:
      case HttpStatus.noContent:
        return Right(response.data);
      case HttpStatus.badRequest:
        return Left(result);
      case HttpStatus.unauthorized:
        return Left(result);
      case HttpStatus.forbidden:
        return Left(ForbiddenFailure());
      case HttpStatus.notFound:
        return Left(NotFoundFailure());
      case HttpStatus.unprocessableEntity:
        return Left(result);
      case HttpStatus.internalServerError:
        return Left(InternalFailure());
      case HttpStatus.gatewayTimeout:
        return Left(GatewayTimeOutFailure());
      default:
        return Left(NotFoundFailure());
    }
  }
}
