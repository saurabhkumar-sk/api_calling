import 'package:flutter/material.dart';

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
}
