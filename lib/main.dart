import 'package:akij_assignment/configs/colors.dart';
import 'package:akij_assignment/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Akij Group Assignment',
      theme: ThemeData(
        fontFamily: "JosefinSans",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: AppColors.seed,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}


