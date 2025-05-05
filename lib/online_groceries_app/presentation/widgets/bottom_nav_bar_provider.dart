import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex(int indexFromUI) {
    selectedIndex = indexFromUI;
    notifyListeners();
  }
}

final bottomNavBarProvider = ChangeNotifierProvider((ref) {
  return BottomNavBarProvider();
});
