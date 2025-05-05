import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/account/account_ui.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/explore/explore_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/bottom_nav_bar_provider.dart';

class BottomNavigationBarScreen extends ConsumerStatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  ConsumerState<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends ConsumerState<BottomNavigationBarScreen> {
  List<Widget> bottomNavBarItemList = [
    HomeScreen(),
    ExploreScreen(),
    Center(child: Text("Cart")),
    Center(child: Text("Favorite")),
    AccountUi(),
    
  ];

  void onItemTapped(int index) {
    ref.read(bottomNavBarProvider).changeSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndexFromProvider =
        ref.watch(bottomNavBarProvider).selectedIndex;
    return Scaffold(
      body: bottomNavBarItemList.elementAt(selectedIndexFromProvider),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image(
              image: AssetImage("assets/bottom_nav_bar_shop_1.png"),
            ),
            icon: Image(
              image: AssetImage("assets/bottom_nav_bar_shop_unselec.png"),
            ),

            label: 'Shop',
          ),
          BottomNavigationBarItem(
            activeIcon: Image(
              image: AssetImage("assets/bottom_nav_bar_explore.png"),
            ),
            icon: Image(
              image: AssetImage("assets/bottom_nav_bar_explore_unselect.png"),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            activeIcon: Image(
              image: AssetImage("assets/bottom_nav_bar_cart_select.png"),
            ),
            icon: Image(
              image: AssetImage("assets/bottom_nav_bar_cart_unselect.png"),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite_outline, color: Color(0xFF53B175)),
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            activeIcon: Image(
              image: AssetImage("assets/bottom_nav_bar_account_select.png"),
            ),
            icon: Image(
              image: AssetImage("assets/bottom_nav_bar_account_unselect.png"),
            ),
            label: "Account",
          ),
        ],
        currentIndex: selectedIndexFromProvider,
        selectedItemColor: Color(0xFF53B175),
        unselectedItemColor: Color(0xFF181725),
        onTap: onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
