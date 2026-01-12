import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/drawer.dart';
import '../components/options.dart';
import '../types.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.userInfo});

  final String title;
  final dynamic userInfo;

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
      drawer: MyDrawerWidget(userInfo: widget.userInfo),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    RotationTransition(
                      turns: _animation,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/enterworld');
                          },
                          // child: SvgPicture.asset(
                          //   planetTypes[widget.userInfo.worldtype]!["planet"] ?? 'assets/images/svgs/planets/craterplanet.svg',
                          //   fit: BoxFit.fitHeight,
                          // ),
                          child: Container(
                            height: 400,
                            width: 400,
                            child: FittedBox(
                              child: ImageIcon(
                                AssetImage(
                                  planetTypes[widget
                                          .userInfo
                                          .worldtype]!["planet"] ??
                                      'assets/images/pngs/planets/craterplanet.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
            Column(
              children: [
                Text('Welcome to ' + widget.userInfo.worldname + ","),
                Text(
                  widget.userInfo.username,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Tap your world to enter."),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(userInfo: widget.userInfo),
    );
  }
}
