class PaginatedResponse<T> {
  final int page;
  final int pageSize;
  final List<T> data;

  PaginatedResponse({
    required this.page,
    required this.pageSize,
    required this.data,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      page: json['page'] ?? 1,
      pageSize: json['pageSize'] ?? 20,
      data: json['data'] != null
          ? (json['data'] as List).map((item) => fromJsonT(item)).toList()
          : [],
    );
  }
}
