import '../errors/app_error.dart';

class NetworkBoundary<T>{
  final T? data;
  final AppError? error;

  const NetworkBoundary({this.data, this.error});
}