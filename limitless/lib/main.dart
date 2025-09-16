import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'settings.dart';

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
      home: MyHomePage(
        title: 'Limitless (WIP)',
        userInfo: UserInfo(
          username: "TheBestUser",
          worldname: "FabulousWorldtopolis",
          worldtype: "Crater Planet",
          outfittype: "Galaxy"
        )
      ),
    );
  }
}
