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
                    child: ImageIcon(
                      AssetImage(
                        planetTypes[widget.userInfo.worldtype]!["planet"] ??
                            'assets/images/pngs/planets/craterplanet.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Limitless Shop"),
            onTap: () {
              Navigator.pushNamed(context, '/shop');
              print(ModalRoute.of(context)?.settings.name);
            },
          ),
          ListTile(
            title: Text("Creators Hub"),
            onTap: () {
              Navigator.pushNamed(context, '/creators');
              print(ModalRoute.of(context)?.settings.name);
            },
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: Text("About Limitless"),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
