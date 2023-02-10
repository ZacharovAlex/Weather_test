
import 'app_error.dart';

class DefaultError extends AppError {
  @override
  final String? message;

  DefaultError([this.message]);
}
