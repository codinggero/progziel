import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class App {
  final BuildContext context;
  static late BuildContext buildContext;
  static Orientation orientation = Orientation.portrait;
  static double width = 0.0;
  static double height = 0.0;
  static num column = 0;
  static double padding = 0.0;
  static double margin = 0.0;

  static Color seedColor = const Color(0xFFEFF1F4);
  static Color background = const Color(0xFFEFF1F4);

  static Color black = const Color(0xFF000000);
  static Color blackRussian = const Color(0xFF101F28);
  static Color dimGray = const Color(0xFF707070);
  static Color eclipse = const Color(0xFF3A3A45);
  static Color frostedMint = const Color(0xFFE4E2F2);
  static Color greatWhite = const Color(0xFFBBBBC4);
  static Color green = const Color(0xFF34A853);
  static Color kuroiBlack = const Color(0xFF06060A);
  static Color nandor = const Color(0xFF585862);
  static Color royalBlue = const Color(0xFF4285F4);
  static Color steelBlue = const Color(0xFF3A8EA5);
  static Color stormGrey = const Color(0xFF7B7B85);
  static Color white = const Color(0xFFFFFFFF);

  static String? fontFamily = GoogleFonts.getFont('Open Sans').fontFamily;
  static String title = "App";

  App(this.context) {
    buildContext = context;
    orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      init(context);
    }
    if (orientation == Orientation.portrait) {
      init(context);
    }
  }

  static ThemeMode? themeMode = ThemeMode.system;

  static TextTheme? textTheme = const TextTheme();

  static ThemeData theme = ThemeData(
    fontFamily: fontFamily,
    textTheme: textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      background: background,
    ),
    useMaterial3: true,
  );

  static double hp(double n) {
    return height * n / 100;
  }

  static double wp(double n) {
    return width * n / 100;
  }

  static double p(double v, double p) {
    return v * p / 100;
  }

  static init(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
        statusBarColor: white,
        systemNavigationBarColor: white,
        systemNavigationBarDividerColor: white,
        statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
      ),
    );

    if (width >= 0 && width <= 599) {
      column = 4;
      padding = 16;
      margin = 16;
    }

    if (width >= 600 && width <= 904) {
      column = 8;
      padding = 32;
      margin = 32;
    }

    if (width >= 905) {
      column = 12;
      padding = 32;
      margin = 32;
    }
  }
}
