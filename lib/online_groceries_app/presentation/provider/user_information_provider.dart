import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformationProvider extends ChangeNotifier {
  String userName = "";
  String email = "";
  String password = "";

  void storeUserInfromation({
    required String userNameFromUI,
    required String emailFromUI,
    required String passwordFromUI,
  }) {
    userName = userNameFromUI;
    email = emailFromUI;
    password = passwordFromUI;
    notifyListeners();
    debugPrint("User Information are $userName,$email,$password");
  }

  void editName({required String userNameFromUI}) {
    userName = userNameFromUI;
    notifyListeners();
  }
}

final userInformationProvider = ChangeNotifierProvider((ref) {
  return UserInformationProvider();
});
