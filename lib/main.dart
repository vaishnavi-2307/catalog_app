import 'package:catalog_app/pages/Home_details.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/HomePage.dart';
import 'pages/Login_page.dart';
import 'utils/routes.dart';
import 'utils/themes.dart';

void main() {
  runApp(VxState(store: null, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.CartRoute: (context) => CartPage(),
        MyRoutes.detailhomeRoute: (context) => HomeDetailPage(),
      },
    );
  }
}
