

import 'app_error.dart';

class ApiError extends AppError {
  @override
  final String? message;

  ApiError([this.message]);
}
