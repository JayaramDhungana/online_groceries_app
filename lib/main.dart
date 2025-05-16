import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/splash/splash_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/sign_up/sign_up_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final GoRouter _router = GoRouter(
  initialLocation: '/bottom_nav_bar',
  routes: [
    GoRoute(
      name: 'splash_screen',
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      name: 'sign_up',
      path: '/sign_up',
      builder: (context, state) => SignUpScreen(),
    ),

    GoRoute(
      path: '/bottom_nav_bar',
      builder: (context, state) => BottomNavigationBarScreen(),
    ),

    GoRoute(
      path: '/Product_details_screen',
      builder: (context, state) {
        final stateValue = state.extra! as Map<String, dynamic>;
        debugPrint(stateValue['name']);
        return ProductDetailScreen(
          image: stateValue['image'],
          productImageUrl: stateValue['productImageUrl'],
          productName: stateValue['productName'],
          index: stateValue['index'],
          productPrice: stateValue['productPrice'],
          productPieces: stateValue['productPieces'],
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: _router,
          // home:
          //     //  BottomNavigationBarScreen(),
          //     SplashScreen(),
        );
      },
    );
  }
}
//**
//Figma Link
//https://www.figma.com/design/1IL2HtRwv2piIEyDUR9Y2r/Online-Groceries-App-UI--Community-?node-id=1-2&p=f&t=4oTg7Ow741MnxDdo-0
// */