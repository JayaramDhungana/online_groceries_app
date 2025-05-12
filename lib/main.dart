import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home:
              // BottomNavigationBarScreen(),
              // HomeScreen(),
              SplashScreen(),
        );
      },
    );
  }
}
//**
//Figma Link
//https://www.figma.com/design/1IL2HtRwv2piIEyDUR9Y2r/Online-Groceries-App-UI--Community-?node-id=1-2&p=f&t=4oTg7Ow741MnxDdo-0
// */