import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../uicomponents/drawer.dart';
import '../uicomponents/options.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.title, required this.userInfo});
  final String title;
  final dynamic userInfo;
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
        userInfo: widget.userInfo,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: ListView(
          children: [Center(child: Text("This is the Limitless Shop Page"))],
        ),
      )),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ), // Remove this worldname stuff later?
    );
  }
}
