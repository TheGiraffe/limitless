import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../components/drawer.dart';
import '../components/options.dart';

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
      drawer: MyDrawerWidget(userInfo: widget.userInfo,),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Map Page")],
        ),
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ), // Remove this worldname stuff later?
    );
  }
}