class ApiResult<T> {
  final T? data;
  final String? error;
  final bool success;

  ApiResult({this.data, this.error, required this.success});

  factory ApiResult.success(T data) {
    return ApiResult(data: data, success: true);
  }

  factory ApiResult.failure(String error) {
    return ApiResult(error: error, success: false);
  }
}