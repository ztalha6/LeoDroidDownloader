import 'package:get/get.dart';

import '../modules/apps/bindings/apps_binding.dart';
import '../modules/apps/views/apps_view.dart';
import '../modules/codes/bindings/codes_binding.dart';
import '../modules/codes/views/codes_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Splash(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.APPS,
      page: () => const AppsView(),
      binding: AppsBinding(),
    ),
    GetPage(
      name: _Paths.CODES,
      page: () => const CodesView(),
      binding: CodesBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
  ];
}
