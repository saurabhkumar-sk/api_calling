import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final wedSiteUri = Uri.parse("https://pub.dev/packages/url_launcher");
const String uri = "www.google.com";
final Uri googlewed = Uri(scheme: "https", host: uri);

class HomeScreenProvider extends ChangeNotifier {
  bool? isEligible;
  String? eligibilityMessage = '>=18';

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMessage = "You are Eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMessage = "You are  not Eligible";
      notifyListeners();
    }
  }

  Future<void> webApplaunchUrl() async {
    final url = Uri.parse("https://pub.dev/packages/url_launcher");

    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "something Wrong";
    }
  }

  Future<void> appWebView() async {
    if (!await canLaunchUrl(wedSiteUri)) {
      await launchUrl(
        wedSiteUri,
        mode: LaunchMode.inAppBrowserView,
      );
    }
  }

  Future<void> launchUrls() async {
    if (!await canLaunchUrl(wedSiteUri)) {
      await launchUrl(wedSiteUri);
    } else {
      throw "SomeThing went Wrong";
    }
  }

  Future<void> googlelaunchUrl() async {
    if (!await canLaunchUrl(googlewed)) {
      await launchUrl(googlewed);
    } else {
      throw "SomeThing went Wrong";
    }
  }
}
