import 'package:get/get.dart';
import 'package:teamx/app/data/models/application_response.dart';
import 'package:teamx/app/data/services/api_service.dart';
import 'package:teamx/app/data/services/exception_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class CodesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ApplicationResponse> appList = RxList([]);

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getData();
    isLoading.value = false;
    super.onInit();
  }

  Future<List<ApplicationResponse>> getApps() async {
    try {
      List<ApplicationResponse> response =
          await APIService().getApplications(withcode: true);
      return response;
    } catch (e) {
      ExceptionHandler().handle(e);
      return [ApplicationResponse(id: 0)];
    }
  }

  getData() async {
    appList.value = await getApps();
  }

  Future<void> urlLaunch(int i) async {
    if (!await launchUrl(Uri.parse(appList[i].link!),
        mode: LaunchMode.externalApplication)) {
      // throw 'Could not launch $_url';
    }
  }
}
