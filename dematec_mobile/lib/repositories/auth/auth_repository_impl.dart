import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_login_constants.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/dtos/request/login_request.dart';
import 'package:dematec_mobile/dtos/response/login_response.dart';
import 'package:dematec_mobile/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<Either<ApiException, LoginResponse>> login(
    String username,
    String password,
  ) async {
    final request = LoginRequest(username: username, password: password);

    return await _apiClient.post<LoginResponse>(
      ApiLoginConstants.login,
      body: request.toMap(),
      fromJson: (json) => LoginResponse.fromJson(json),
    );
  }
}
