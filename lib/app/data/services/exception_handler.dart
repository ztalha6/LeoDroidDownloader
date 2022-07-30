import 'package:teamx/app/data/services/snackbar_manager.dart';

import 'http/dio_interceptor.dart';

class ExceptionHandler {
  void handle(Object e) {
    if (e is BadRequestException ||
        e is UnauthorizedException ||
        e is InternalServerErrorException ||
        e is NoInternetConnectionException ||
        e is DeadlineExceededException) {
      SnackbarManager().showAlertSnackbar(e.toString());
    }
  }
}
