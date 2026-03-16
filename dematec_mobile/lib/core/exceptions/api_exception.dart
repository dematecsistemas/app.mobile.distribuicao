class ApiException {
  final String message;
  final int? statusCode;
  final dynamic body;

  ApiException({required this.message, this.statusCode, this.body});
}
