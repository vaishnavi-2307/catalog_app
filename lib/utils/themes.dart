import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: darkblueish,
        buttonColor: lightblueish,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        cardColor: Colors.black,
        brightness: Brightness.dark,
        canvasColor: darkcream,
        buttonColor: lightblueish,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6.copyWith(color: Colors.white),
              ),
        ),
      );

  static const Color CreamColor = Color(0xfff5f5f5);
  static const Color darkblueish = Color(0xff403b58);
  static const Color lightblueish = Vx.indigo500;
  static const Color darkcream = Vx.gray800;
}
