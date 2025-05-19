import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/SharedPreferences/sharedPreferences_data.dart';

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

    //to store userData to the Shared Preferences
    String jsonEecodedUserInformation = jsonEncode({
      "userName": userName,
      "email": email,
      "password": password,
    });
    SharedpreferencesData.addUserData(jsonEecodedUserInformation);
  }

  void editName({required String userNameFromUI}) {
    userName = userNameFromUI;
    notifyListeners();
  }

  /***************  Extract User Information Data From Shared Preferences */

  Future<void> extractUserInformation() async {
    List<String> userInformationFromSharedPrefereces =
        await SharedpreferencesData.extractUserData();

    final userInformation = jsonDecode(
      userInformationFromSharedPrefereces.toString(),
    );

    debugPrint("User Information Extracted ${userInformation[0]["userName"]}");

    userName = userInformation[0]["userName"];
    email = userInformation[0]["email"];
    password = userInformation[0]["password"];
    notifyListeners();
  }
}

final userInformationProvider = ChangeNotifierProvider((ref) {
  return UserInformationProvider();
});
