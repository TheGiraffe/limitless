import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 30),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    child: RotationTransition(
                      turns: _animation,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          'assets/images/svgs/craterplanet.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('Welcome to Limitless,'),
                Text(
                  widget.username,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("This is where your world is gonna be."),
                ),
              ],
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
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "MyWorld",
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            tooltip: 'My World',
            child: const Icon(Icons.language),
          ),
        ),
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

class NewSeriesForm extends StatefulWidget {
  const NewSeriesForm({super.key});
  @override
  State<NewSeriesForm> createState() => _NewSeriesFormState();
}

class _NewSeriesFormState extends State<NewSeriesForm> {
  bool addFeature = false;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Create New Series",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name of Series'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Add Story Features",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: Text("Test"),
                  value: addFeature, 
                onChanged: (bool? value){
                  setState((){
                    addFeature = value!;
                  });
                })
              ]
            ))
        ]
        ),
      ),
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
  final ButtonStyle btnstyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );
  final double _buttonPadding = 8;
  bool _newSeriesFormVisible = false;
  void _showNewSeriesForm() {
    setState(() {
      _newSeriesFormVisible = true;
    });
  }

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
          children: <Widget>[
            if (_newSeriesFormVisible) NewSeriesForm(),
            !_newSeriesFormVisible
                ? Container(
                    padding: EdgeInsets.all(_buttonPadding),
                    child: ElevatedButton(
                      style: btnstyle,
                      onPressed: _showNewSeriesForm,
                      child: const Text("Create New Series"),
                    ),
                  )
                : Container(),
            _newSeriesFormVisible
                ? Container(
                    padding: EdgeInsets.all(_buttonPadding),
                    child: ElevatedButton(
                      style: btnstyle,
                      onPressed: () {},
                      child: const Text("<< Edit Existing Series Instead"),
                    ),
                  )
                : Container(
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
      floatingActionButton: OptionsWidget(
        worldname: "worldname",
      ), // Remove this worldname stuff later?
    );
  }
}

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
      floatingActionButton: OptionsWidget(
        worldname: "worldname",
      ), // Remove this worldname stuff later?
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
          children: [
            Text(
              "This is the Shop Page - people will be able to buy stuff here.",
            ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(
        worldname: "worldname",
      ), // Remove this worldname stuff later?
    );
  }
}
