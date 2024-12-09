//tema aplikasi terang

import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';

class LightTheme{
  LightTheme(this.primaryColor);
//jenis warna yang dipakai tergantung situasi
  final Color primaryColor;
  final Color errorColor = AppColors.red;
  final Color scaffoldColor = AppColors.white;
  final Color textSolidColor = AppColors.black;
  final Color textDisableColor = AppColors.black[400]!;
//konfigurasi warna seacrh bar
  final Color inputColor = AppColors.white[400]!;
//konfigurasi warna border kotak homepage
  final Color borderColor = AppColors.orange[600]!;
//konfigurasi warna navigation bar1
  final Color disabledColor = AppColors.black[200]!;
  final Color textDdsabledColor = AppColors.black[400]!;
 //konfigurasi warna dan tema divider/pemisah (dividerColor)1
  final Color dividerColor = AppColors.white[400]!;

  final String fontFamily = 'Poppins';

   ColorScheme get colorScheme => ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        error: errorColor,
      );


//konfigurasi bentuk dan tema text1
//tema konfig teks headline---------------------------------
  TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyle(
      fontSize: Dimens.dp32,
      fontWeight: FontWeight.bold,
      color: textSolidColor,
    ),
    headlineMedium: TextStyle(
      fontSize: Dimens.dp24,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
    headlineSmall: TextStyle(
      fontSize: Dimens.dp20,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
//tema konfig teks title---------------------------------
     titleLarge: TextStyle(
      fontSize: Dimens.dp16,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
     titleMedium: TextStyle(
      fontSize: Dimens.dp14,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
//tema konfig teks body---------------------------------
    bodyLarge: TextStyle(
      fontSize: Dimens.dp16,
      fontWeight: FontWeight.w500,
      color: textSolidColor,
    ),
     bodyMedium: TextStyle(
      fontSize: Dimens.dp14,
      fontWeight: FontWeight.normal,
      color: textSolidColor,
    ),
//tema konfig teks label---------------------------------
    labelMedium: TextStyle(
      fontSize: Dimens.dp12,
      fontWeight: FontWeight.w600,
      color: textDisableColor,
    ),
  );
  
////konfigurasi konfig template navigationbar (NagationTheme)1
    BottomNavigationBarThemeData get bottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: disabledColor,
      selectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Dimens.dp10,
        color: primaryColor
      ),
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Dimens.dp10,
        color: disabledColor,
      ),
    );
  }
//konfigurasi konfig template appbar homepage (AppBarTheme)1
//konfigurasi app bar beranda agar tidak ketengah
AppBarTheme get appBarTheme => AppBarTheme(centerTitle: false, 
surfaceTintColor: scaffoldColor,
); //konfigurasi agar app bar ketika di scroll tidak memunculkan animasi warna

//konfigurasi konfig template kotak kecil homepage (cardtheme)1
  CardTheme get cardTheme => CardTheme(
        //konfigurasi bayangan kotak kecil homepage
          elevation: 10,
        //konfigurasi margin kotak kecil home page
          margin: EdgeInsets.zero,
        //konfigurasi bentuk shape kotak kecil home page
            shape: RoundedRectangleBorder(
        //konfigurasi radius besar border kotak kecil home page
              borderRadius: BorderRadius.circular(Dimens.dp8),
        //konfigurasi warna border kotak homepage2
              side: BorderSide(color: borderColor)
            ),
        );

//konfigurasu tombol tema (elevatedButtonTheme)1
get elevatedButtonTheme{
  return  ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        backgroundColor: primaryColor,
        foregroundColor: scaffoldColor,
        textStyle: textTheme.titleMedium,
        ),
      );
}
//konfigurasu tombol tema (outlinedButtonTheme)1
get outlinedButtonTheme{
  return OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        side:BorderSide(color: primaryColor),
        foregroundColor: primaryColor,
        textStyle: textTheme.titleMedium,
        ),
      );
}

//konfigurasi tema untuk input text (nputDecorationTheme)1
get inputDecorationTheme{
  return InputDecorationTheme(
          fillColor: inputColor,
          filled: true,
          hintStyle: textTheme.labelMedium,
          prefixIconColor: textDisableColor ,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.defaultSize,
            vertical: Dimens.dp12,
          ) ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
              borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
              borderSide: BorderSide.none,
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            borderSide: BorderSide(color: primaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            borderSide: BorderSide(color: errorColor),
          ),
           errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            borderSide: BorderSide(color: errorColor),
          ),
        );

}
//konfigurasi warna dan tema divider/pemisah (dividerTheme)1
DividerThemeData get dividerTheme {
    return DividerThemeData(color: dividerColor, space: Dimens.dp24);
  }


//konfigurasi bentuk dan tema text2
  ThemeData get theme{
    return ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: textTheme,
        //konfigurasi konfig template appbar homepage (AppBarTheme)2
        appBarTheme: appBarTheme,
        //konfigurasi konfig template kotak kecil homepage (cardtheme)2
        cardTheme:cardTheme ,
        //konfigurasi konfig template navigationbar (NagationTheme)2
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        //konfigurasu tombol tema (elevatedButtonTheme)2
        elevatedButtonTheme: elevatedButtonTheme,
        //konfigurasu tombol tema (outlinedButtonTheme)2
        outlinedButtonTheme: outlinedButtonTheme,
        //konfigurasi tema untuk input text (nputDecorationTheme)2
        inputDecorationTheme: inputDecorationTheme,
        //konfigurasi warna dan tema divider/pemisah (dividerColor)2
        dividerColor: dividerColor,
        //konfigurasi tema divider/pemisah (dividerTheme)2
        dividerTheme: dividerTheme,
      );
  }
}

