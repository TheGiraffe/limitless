import 'package:flutter/material.dart';
import 'package:limitless/types.dart';
import '../components/options.dart';
import '../components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterWorld extends StatefulWidget {
  const EnterWorld({super.key, required this.userInfo});

  final dynamic userInfo;

  @override
  State<EnterWorld> createState() => _EnterWorldState();
}

class _EnterWorldState extends State<EnterWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.userInfo.worldname),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("This is where you can interact with your world!"),
            Expanded(
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    outfitTypes[widget.userInfo.outfittype] ??
                    'assets/images/svgs/characters/self/default.svg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ), // Remove this worldname stuff later?
    );
  }
}
