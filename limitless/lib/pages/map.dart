import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/drawer.dart';
import '../components/options.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title, required this.worldname, required this.username});
  final String title;
  final String worldname;
  final String username;
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
      drawer: MyDrawerWidget(username: widget.username, worldname: widget.worldname),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Map Page")],
        ),
      ),
      floatingActionButton: OptionsWidget(
        worldname: widget.worldname, username: widget.username,
      ), // Remove this worldname stuff later?
    );
  }
}