class PaginatedModel<T> {
  final int page;
  final int pageSize;
  final List<T> data;

  PaginatedModel({
    required this.page,
    required this.pageSize,
    required this.data,
  });
}
