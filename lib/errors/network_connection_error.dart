

import 'app_error.dart';

class NetworkConnectionError extends AppError {
  @override
  // TODO: implement message
  String? get message => 'Нет интернет соединения';
  const NetworkConnectionError();
}
