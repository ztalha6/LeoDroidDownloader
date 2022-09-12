import 'package:get/get.dart';
import 'package:teamx/app/data/models/application_response.dart';
import 'package:teamx/app/data/services/api_service.dart';
import 'package:teamx/app/data/services/exception_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class AppsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxList<ApplicationResponse> appList = RxList([]);
  int page = 1;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getData();
    isLoading.value = false;
    super.onInit();
  }

  Future<List<ApplicationResponse>> getApps(int page) async {
    try {
      List<ApplicationResponse> response =
          await APIService().getApplications(page: page);
      return response;
    } catch (e) {
      ExceptionHandler().handle(e);
      return [];
    }
  }

  getData() async {
    appList.value = await getApps(page);
  }

  loadMore() async {
    isLoadingMore.value = true;
    page++;
    List<ApplicationResponse> list = await getApps(page);
    if (list.isNotEmpty) appList.addAll(list);
    isLoadingMore.value = false;
  }

  Future<void> urlLaunch(int i) async {
    if (!await launchUrl(Uri.parse(appList[i].link!),
        mode: LaunchMode.externalApplication)) {
      // throw 'Could not launch $_url';
    }
  }
}
