import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var planetTypes = {
      "Crater Planet": 'assets/images/svgs/planets/craterplanet.svg',
      "Spiky Planet":'assets/images/svgs/planets/spikyplanet.svg',
      "Pebble Planet":'assets/images/svgs/planets/pebbleplanet.svg',
      "Storm Planet":'assets/images/svgs/planets/stormplanet.svg',
      };
    
    var squareTypes = {
      // Will do more descriptive names for these in the future...
      "Square1": 'assets/images/svgs/squares/sq1.svg',
      "Square2": 'assets/images/svgs/squares/sq2.svg',
      "Square3": 'assets/images/svgs/squares/sq3.svg',
      "Square4": 'assets/images/svgs/squares/sq4.svg',
      "Square5": 'assets/images/svgs/squares/sq5.svg',
      "Square6": 'assets/images/svgs/squares/sq6.svg',
      "Square7": 'assets/images/svgs/squares/sq7.svg',
      "Square8": 'assets/images/svgs/squares/sq8.svg',
      "Square9": 'assets/images/svgs/squares/sq9.svg',
      "Square10": 'assets/images/svgs/squares/sq10.svg',
    };

    var weirdTypes = {
      "Random Void": 'assets/images/svgs/weird/randomvoid.svg'
    };

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
          onSurface: Colors.white
        ),
      ),
      home: const MyHomePage(
        title: 'Limitless (WIP)',
        username: "Test user name",
        worldname: "Test world name",
      ),
    );
  }
}
