import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpValidationProvider extends ChangeNotifier {
  String userNameErrorText = "";
  String emailErrorText = "";
  String passwordErrorText = "";

  //for username error text
  void onChnagedUserNameValidation(String userNameFromUI) {
    if (userNameFromUI.isEmpty) {
      userNameErrorText = "User Name should not be empty";
    } else {
      userNameErrorText = "";
    }
    notifyListeners();
  }

  //for email error text
  void onChangedEmailValidation(String emailFromUI) {
    if (emailFromUI.isEmpty) {
      emailErrorText = "Email Should not be empty";
    } else if (!(emailFromUI.contains("@"))) {
      emailErrorText = "Invalid Email Address.It should be contain @ symbol";
    } else {
      emailErrorText = "";
    }
    notifyListeners();
  }

  //for password Error Text
  void onChangedPasswordValidation(String passwordFromUI) {
    if (passwordFromUI.isEmpty) {
      passwordErrorText = "Password should not be null";
    } else if (passwordFromUI.length < 8) {
      passwordErrorText = "Password should be 8 character long";
    } else {
      passwordErrorText = "";
    }
    notifyListeners();
  }
}

final signUpValidationProvider = ChangeNotifierProvider((ref) {
  return SignUpValidationProvider();
});
