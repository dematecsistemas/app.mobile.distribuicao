import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/dtos/response/login_response.dart';

abstract class AuthRepository {
  Future<Either<ApiException, LoginResponse>> login(
    String username,
    String password,
  );
}
