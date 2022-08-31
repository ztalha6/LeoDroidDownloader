import 'package:flutter_ads_mediation/ads_providers/banner_ads_provider.dart';
import 'package:get/get.dart';
import 'package:teamx/ad_unit_ids/ad_unit_id.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  BannerAdsProvider bannarAd = BannerAdsProvider(bannerAdId: AdUnitId.banner);

  Future<void> urlLaunch() async {
    if (!await launchUrl(Uri.parse('https://leodroiddownloader.com/'),
        mode: LaunchMode.externalApplication)) {
      // throw 'Could not launch $_url';
    }
  }
}
