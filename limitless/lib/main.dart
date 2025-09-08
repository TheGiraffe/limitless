import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          surface: Colors.black,
          onSurface: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.username,
    required this.worldname,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String username;
  final String worldname;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to Limitless,'),
            Text(
              widget.username,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Here, you can:")],
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      "- Create stories",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text("- Collect items", textAlign: TextAlign.center),
                  ),
                  ListTile(
                    title: Text(
                      "- Save your world",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(worldname: widget.worldname),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key, required this.worldname});
  final String worldname;
  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  final double _actionButtonPadding = 8;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "Explore",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ExplorePage(title: 'Explore'),
                ),
              );
            },
            tooltip: 'Explore',
            child: const Icon(Icons.rocket),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(_actionButtonPadding),
        //   child: FloatingActionButton(
        //     heroTag: "MyWorld",
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute<void>(
        //           builder: (context) => CreatorsPage(title: widget.worldname),
        //         ),
        //       );
        //     },
        //     tooltip: 'My World',
        //     child: const Icon(Icons.language),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "Shop",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ShopPage(title: "Shop"),
                ),
              );
            },
            tooltip: "Shop",
            child: const Icon(Icons.store),
          ),
        ),
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "CreatorsHub",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => CreatorsPage(title: 'Creators Hub'),
                ),
              );
            },
            tooltip: 'Creators Hub',
            child: const Icon(Icons.library_add),
          ),
        ),
      ],
    );
  }
}

class CreatorsPage extends StatefulWidget {
  const CreatorsPage({super.key, required this.title});
  final String title;
  @override
  State<CreatorsPage> createState() => _CreatorsPageState();
}

class _CreatorsPageState extends State<CreatorsPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ButtonStyle btnstyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );
  final double _buttonPadding = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(_buttonPadding),
              child: ElevatedButton(
                style: btnstyle,
                onPressed: () {},
                child: const Text("Create New Series"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(_buttonPadding),
              child: ElevatedButton(
                style: btnstyle,
                onPressed: () {},
                child: const Text("Create New Story in Series"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(_buttonPadding),
              child: ElevatedButton(
                style: btnstyle,
                onPressed: () {},
                child: const Text("Edit Existing Series"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 decoration: const InputDecoration(hintText: 'Name of Series'),
//               ),
//             ],
//           ),
//         ),

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, required this.title});
  final String title;
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Explore Page")],
        ),
      ),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.title});
  final String title;
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Shop Page - people will be able to buy stuff here.")],
        ),
      ),
    );
  }
}
