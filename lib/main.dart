import 'package:fashoon/core/store.dart';
import 'package:fashoon/elements/routes.dart';
import 'package:fashoon/screens/cart_screen.dart';
import 'package:fashoon/screens/home_details_page.dart';
import 'package:fashoon/screens/home_screen.dart';
import 'package:fashoon/screens/login_screen.dart';
import 'package:fashoon/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.cartRoute: (context) => CartScreen(),
      },
    );
  }
}
