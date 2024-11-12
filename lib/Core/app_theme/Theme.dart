import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTheme {


  static var ligthTheme = ThemeData.light().copyWith(

      cardColor: Color.fromRGBO(41, 152, 146, 1),
      primaryColor: Color.fromRGBO(41, 152, 146, 1),

      appBarTheme: AppBarTheme(
          color: Color.fromRGBO(41, 152, 146, 1),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),

      iconTheme: IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 0.6)
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            // color: Color.fromRGBO(152, 2, 2, 1),
            //   color: Colors.yellow
          ),
          foregroundColor: Colors.white, // Text color
          backgroundColor: Colors.transparent, // Button background color
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(5, 91, 144, 1),
          // Button background color
          foregroundColor: Colors.white, // Text color
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white
      ),

      textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Color.fromRGBO(41, 152, 146, 1),
            fontFamily: 'Cairo'
          ),
          displayMedium: TextStyle(
            color: Color.fromRGBO(3, 62, 99, 0.5),
              fontFamily: 'Cairo'
          ),
          displaySmall: TextStyle(
            color: Colors.black,
              fontFamily: 'Cairo'
          )
      )
  );

}