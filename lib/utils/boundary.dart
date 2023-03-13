import '../errors/app_error.dart';

class NetworkBoundary<T>{
  final T? data;
 // final T? dataForecast;
  final AppError? error;

  const NetworkBoundary({this.data, this.error});
}