sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;
  Success(this.data);
}

class Error<T> extends Result<T> {
  String? errorMsg;
  Error(this.errorMsg);
}
