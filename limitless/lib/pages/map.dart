import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../uicomponents/drawer.dart';
import '../uicomponents/options.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title, required this.userInfo});
  final String title;
  final dynamic userInfo;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("Arcade"),
                  onTap: () {
                    print("Navigator will push this page");
                  },
                ),
                ListTile(
                  title: Text("The Alchemist"),
                  onTap: () {
                    print(
                      "Potion shop, some fun wisdom and chemistry knowledge!",
                    );
                  },
                ),
                ListTile(
                  title: Text("Farmers Market"),
                  onTap: () {
                    print(
                      "Farmers Market for selling produce & other such goods",
                    );
                  },
                ),
                ListTile(
                  title: Text("Crafting Makerspace"),
                  onTap: () {
                    print(
                      "Makerspace for crafting stuff",
                    );
                  },
                ),
                ListTile(
                  title: Text("Otherlands"),
                  onTap: () {
                    print("Other lands that the user is subscribed to");
                  },
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
