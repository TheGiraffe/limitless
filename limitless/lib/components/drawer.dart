import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../types.dart';

class MyDrawerWidget extends StatefulWidget {
  const MyDrawerWidget({super.key, required this.userInfo});
  final dynamic userInfo;
  @override
  State<MyDrawerWidget> createState() => _MyDrawerWidgetState();
}

class _MyDrawerWidgetState extends State<MyDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: ListView(
              children: [
                Text('Hello, ' + widget.userInfo.username),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      planetTypes[widget.userInfo.worldtype]!["planet"] ??
                          'assets/images/svgs/planets/craterplanet.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              print("Settings");
            },
          ),
          ListTile(
            title: Text("About Limitless"),
            onTap: () {
              print("About Limitless");
            },
          ),
        ],
      ),
    );
  }
}
