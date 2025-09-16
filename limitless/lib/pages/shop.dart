import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/drawer.dart';
import '../components/options.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.title, required this.username, required this.worldname});
  final String title;
  final String username;
  final String worldname;
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
      drawer: MyDrawerWidget(
        username: widget.username,
        worldname: widget.worldname,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Shop Page")],
        ),
      ),
      floatingActionButton: OptionsWidget(
        username: widget.username,
        worldname: widget.worldname,
      ), // Remove this worldname stuff later?
    );
  }
}
