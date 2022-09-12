import 'package:dio/dio.dart';
import 'package:teamx/app/data/constants/api_constants.dart';
import 'package:teamx/app/data/models/application_response.dart';
import 'package:teamx/app/data/models/notification_response_model.dart';
import 'package:teamx/app/data/services/http/api.dart';

class APIService {
  final Api _api = Api();
  Future<List<ApplicationResponse>> getApplications({
    bool withcode = false,
    bool droidPlus = false,
    required int page,
  }) async {
    Response response = await _api.createDio().get(withcode
        ? "${ApiContants.code}&page=$page"
        : droidPlus
            ? "${ApiContants.droidPlus}&page=$page"
            : "${ApiContants.applications}&page=$page");
    return ApplicationResponse.fromJsonList(response.data);
  }

  Future<List<NotificationResponse>> getNotifications() async {
    Response response = await _api.createDio().get(ApiContants.notification);
    return NotificationResponse.fromJsonList(response.data);
  }
}
