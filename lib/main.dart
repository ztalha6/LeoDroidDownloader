import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the SDK before making an ad request.
  // You can check each adapter's initialization status in the callback.
  MobileAds.instance.initialize().then((initializationStatus) {
    initializationStatus.adapterStatuses.forEach((key, value) {
      debugPrint('Adapter status for $key: ${value.description}');
    });
  });

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: const Color(0xff5f1399),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff5f1399),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    ),
  );
}
