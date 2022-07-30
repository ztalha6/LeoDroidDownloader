import 'dart:io';

class AdUnitId {
  static String banner =
      Platform.isAndroid ? 'ca-app-pub-6054901892311065/2427354537' : '';
  static String adManagerBanner = Platform.isAndroid ? '' : '';
  static String interstitial = Platform.isAndroid ? '' : '';
  static String rewarded = Platform.isAndroid ? '' : '';
}
