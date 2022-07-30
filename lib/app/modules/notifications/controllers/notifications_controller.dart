import 'package:get/get.dart';
import 'package:teamx/app/data/models/notification_response_model.dart';
import 'package:teamx/app/data/services/api_service.dart';
import 'package:teamx/app/data/services/exception_handler.dart';

class NotificationsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<NotificationResponse> notiList = RxList([]);
  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getData();
    isLoading.value = false;
    super.onInit();
  }

  getData() async {
    notiList.value = await getNotis();
  }

  Future<List<NotificationResponse>> getNotis() async {
    try {
      List<NotificationResponse> response =
          await APIService().getNotifications();
      return response;
    } catch (e) {
      ExceptionHandler().handle(e);
      return [NotificationResponse(id: 0)];
    }
  }
}
