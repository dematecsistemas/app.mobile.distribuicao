import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Either<ApiException, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      final object = fromJson(response.data);
      return Right(object);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(
        ApiException(message: 'Erro ao processar dados: ${e.toString()}'),
      );
    }
  }

  Future<Either<ApiException, T>> post<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.post(path, data: body);
      final object = fromJson(response.data);
      return Right(object);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(
        ApiException(message: 'Erro ao processar dados: ${e.toString()}'),
      );
    }
  }

  Future<Either<ApiException, void>> patch(String path, dynamic body) async {
    try {
      await _dio.patch(path, data: body);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(
        ApiException(message: 'Erro inesperado na requisição: ${e.toString()}'),
      );
    }
  }

  ApiException _handleDioException(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage =
            'Tempo de conexão esgotado. Verifique sua rede e tente novamente.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Erro de conexão. Verifique sua rede.';
        break;
      case DioExceptionType.badResponse:
        final responseData = e.response?.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('errorMessages') &&
            responseData['errorMessages'] is List) {
          final List<dynamic> errorsList = responseData['errorMessages'];
          errorMessage = errorsList.isNotEmpty
              ? errorsList.join('\n')
              : 'Ocorreu um erro no servidor.';
        } else {
          errorMessage =
              e.response?.statusMessage ?? 'Ocorreu um erro no servidor.';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'A requisição foi cancelada.';
        break;
      case DioExceptionType.unknown:
      default:
        errorMessage = 'Ocorreu um erro desconhecido.';
        break;
    }

    return ApiException(
      message: errorMessage,
      statusCode: e.response?.statusCode,
      body: e.response?.data,
    );
  }
}
