import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teamx/app/routes/app_pages.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            controller.urlLaunch();
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATIONS);
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff9f0ff),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 0.5,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.APPS);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon_apps.png',
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Applications',
                      style: TextStyle(
                        color: Color(0xff34273e),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff9f0ff),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 0.5,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CODES);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon_code.png',
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Codes',
                        style: TextStyle(
                          color: Color(0xff34273e),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: controller.bannarAd.ad!.size.height.toDouble(),
              width: double.infinity,
              child: AdWidget(ad: controller.bannarAd.ad!),
            ),
          ],
        ),
      ),
    );
  }
}
