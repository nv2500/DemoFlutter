
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter_app/ui/page/login_screen.dart';
import 'package:flutter_app/ui/data/colors.dart';
import 'package:flutter_app/ui/layout/letter_spacing.dart';
import 'package:flutter_app/ui/page/testing.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/page/home_board_screen.dart';


void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyDemoApp());
}

class MyDemoApp extends StatelessWidget {

  const MyDemoApp();

  static const String loginRoute = '/demo/login';
  static const String homeRoute = '/demo';

  static List<Product> sSavedProductList = List<Product>();

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        // title: 'Welcome to Flutter',
        debugShowCheckedModeBanner: false,
        theme: _buildDemoTheme(),
        home: const LoginScreen(),
        routes: <String, WidgetBuilder>{
          homeRoute: (BuildContext context) => const HomeBoardScreen(),
          loginRoute: (BuildContext context) => const LoginScreen(),
        },
        // initialRoute: loginRoute,
      );
  }

  ThemeData _buildDemoTheme() {
    final base = ThemeData.dark();
    return ThemeData(
      appBarTheme: const AppBarTheme(
          color: DemoColors.primaryBackground,
          brightness: Brightness.dark,
          elevation: 1,
      ),
      scaffoldBackgroundColor: DemoColors.primaryBackground,
      primaryColor: DemoColors.primaryBackground,
      focusColor: DemoColors.focusColor,
      textTheme: _buildDemoTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: DemoColors.gray,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: DemoColors.inputBackground,
        focusedBorder: InputBorder.none,
      ),
      visualDensity: VisualDensity.standard,
    );
  }
  TextTheme _buildDemoTextTheme(TextTheme base) {
    return base
        .copyWith(
      bodyText2: GoogleFonts.robotoCondensed(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      ),
      bodyText1: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
      button: GoogleFonts.robotoCondensed(
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacingOrNone(2.8),
      ),
      headline5: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
    )
        .apply(
      displayColor: DemoColors.textColor,
      bodyColor: DemoColors.textColor,
    );
  }
}


