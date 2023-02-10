import 'package:dio/dio.dart';

import 'package:weather_simple/errors/server_not_reachable_error.dart';

import '../main.dart';
import 'app_error.dart';
import 'default_error.dart';
import 'network_connection_error.dart';

AppError parseError(Object error) {
  logger.e(error);
  if (error is AppError) {
    return error;
  }
  if (error is DioError && error.type == DioErrorType.other && error.message.contains('SocketException')) {
    return const NetworkConnectionError();
  }
  if (error is DioError &&
      (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout)) {
    return const ServerNotReachableError();
  }
  return DefaultError();
}
