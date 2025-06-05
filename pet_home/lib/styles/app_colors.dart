import 'package:flutter/material.dart';

class AppColors {
  static const Color darkGreen = Color(0xFF353617);
  static const Color lightGreen = Color(0xFF8E9762);
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF2C2D2D);
  static const Color brown = Color(0xFF4C2619);
  static const Color lightBrown = Color(0xFF7F6044);
  static const Color beige = Color(0xFFEEE1D1);
  static const Color errorRed = Color(0xFFFF8652);
}

class AppTheme {
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.black, width: 2),
  );

  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.darkGreen,
      scaffoldBackgroundColor: AppColors.lightGreen,

      colorScheme: ColorScheme.light(
        primary: AppColors.darkGreen,
        secondary: AppColors.beige,
        surface: AppColors.lightGreen,
        brightness: Brightness.light,
      ),

      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        backgroundColor: AppColors.lightGreen,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.brown,
          size: 35,
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.black,
          fontSize: 30,
          fontWeight: FontWeight.normal,
        ),
        headlineSmall: TextStyle(
          color: AppColors.black,
          fontSize: 25,
        ),
        displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.black,
          alignment: Alignment.center,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.4),
          side: BorderSide(color: AppColors.black, width: 2),
          fixedSize: Size(200, 40),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.black,
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        hintStyle: TextStyle(color: AppColors.lightBlack.withValues(alpha: 70)),
        errorStyle: TextStyle(color: AppColors.errorRed),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        errorBorder: inputBorder,
        focusedErrorBorder: inputBorder,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGreen,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.black;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: BorderSide(color: AppColors.black, width: 2),
      ),

      cardTheme: CardTheme(
        elevation: 2,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: AppColors.brown, width: 5),
        ),
        margin: EdgeInsets.all(8),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
      ),
    );
  }
}
