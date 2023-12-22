import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final wedSiteUri = Uri.parse("https://pub.dev/packages/url_launcher");

class HomeScreenProvider extends ChangeNotifier {
  bool? isEligible;
  String? eligibilityMessage = '';

  void checkEligibility(int age) {
    if (age > 18) {
      isEligible = true;
      eligibilityMessage = "You are Eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMessage = "You are  not Eligible";
      notifyListeners();
    }
  }

  Future<void> appWebView() async {
    if (!await canLaunch(wedSiteUri.toString())) {
      await launch(
        wedSiteUri.toString(),
        forceWebView: true,
      );
    }
  }

  Future<void> launchUrls() async {
    if (!await canLaunch(wedSiteUri.toString())) {
      await launch(wedSiteUri.toString());
    } else {
      throw "SomeThing went Wrong";
    }
  }

  Future<void> launchUrl() async {
    if (!await canLaunchUrl(wedSiteUri)) {
      throw Exception('Could not launch ');
    }
  }
}
