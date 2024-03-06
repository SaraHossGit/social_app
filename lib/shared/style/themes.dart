import 'package:flutter/material.dart';
import 'package:social_app/shared/style/colors.dart';

ThemeData lightTheme()=>ThemeData(
    scaffoldBackgroundColor: secondaryColor,
    primaryColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor1,
      unselectedItemColor: darkGreyColor,
      backgroundColor: Colors.black12,
      type: BottomNavigationBarType.fixed
    ),
    // appBarTheme: AppBarTheme(
    //   color: darkThemeBG,
    //   iconTheme: const IconThemeData(
    //     color: Colors.white,
    //   ),
    //   titleTextStyle: const TextStyle(color: Colors.white),
    //   toolbarTextStyle: const TextStyle(color: Colors.white),
    // ),
    // tabBarTheme: const TabBarTheme(
    //   labelColor: Colors.white,
    //   unselectedLabelColor: Colors.white30,
    //   dividerHeight: 0,
    //   indicatorSize: TabBarIndicatorSize.label,
    //   indicatorColor: Colors.white,
    //   tabAlignment: TabAlignment.center,
    // ),
    // inputDecorationTheme: const InputDecorationTheme(
    //     labelStyle: TextStyle(color: Colors.black)
    // ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: "AvenirHeavy", color: Colors.white, height: 1),
      displayMedium: TextStyle(
          fontFamily: "AvenirHeavy", color: Colors.white, height: 1),
      headlineLarge: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey, fontFamily: "AvenirLight"),
      // bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white, fontFamily: "AvenirBook"),
      bodySmall: TextStyle(color: Colors.white, fontFamily: "AvenirBook"),
      titleLarge:
      TextStyle(color: Colors.white, fontFamily: "AvenirHeavy"),
      titleMedium:
      TextStyle(color: Colors.white, fontFamily: "AvenirHeavy"),
    ));