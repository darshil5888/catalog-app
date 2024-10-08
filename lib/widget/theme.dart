import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lighttheme => ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: darkBluishcolor,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: darkBluishcolor, // Replaces accentColor
      ),
      appBarTheme: AppBarTheme(
        // backgroundColor: MyTheme.creamColor,
        foregroundColor: MyTheme.darkBluishcolor,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamcolor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightBluishcolor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
      ).copyWith(
        secondary: Colors.white, // Replaces accentColor
      ),

      //  buttonTheme: ButtonThemeData(
      //   buttonColor: lightBluishcolor, // Sets the default button color
      // ),

      appBarTheme: AppBarTheme(
        // backgroundColor: MyTheme.darkcreamcolor,
        foregroundColor: MyTheme.darkBluishcolor,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextStyle(color: Colors.white), // New parameter
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ));

  //Colors

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishcolor = const Color(0xff403b58);
  static Color darkcreamcolor = Vx.gray900;
  static Color lightBluishcolor = Vx.indigo600;
}
