import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'pages/map.dart';
import 'pages/creators.dart';
import 'pages/shop.dart';
import 'pages/enterworld.dart';
import 'pages/about.dart';

var currentUserInfo = UserInfo(
  username: "TheBestUser",
  worldname: "FabulousWorldtopolis",
  worldtype: "Crater Planet",
  outfittype: "Galaxy",
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limitless',
      theme: ThemeData(
        fontFamily: GoogleFonts.spaceMono().fontFamily,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.black,
          surface: Color.fromRGBO(32, 32, 32, 1),
          onSurface: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            MyHomePage(title: 'Limitless (WIP)', userInfo: currentUserInfo),
        '/map': (context) => MapPage(title: "Map", userInfo: currentUserInfo),
        '/shop': (context) => ShopPage(title: 'Shop', userInfo: currentUserInfo),
        '/creators': (context) => CreatorsPage(title: 'Creators Hub', userInfo: currentUserInfo),
        '/enterworld': (context) => EnterWorld(userInfo: currentUserInfo),
        '/settings': (context) => SettingsPage(userInfo: currentUserInfo,),
        '/about': (context) => AboutPage(userInfo: currentUserInfo,)

      },
    );
  }
}
