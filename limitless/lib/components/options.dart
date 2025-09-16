import 'package:flutter/material.dart';
import '../pages/map.dart';
import '../pages/shop.dart';
import '../pages/creators.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({
    super.key,
    required this.worldname,
    required this.username,
  });
  final String worldname;
  final String username;
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
            heroTag: "Map",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => MapPage(title: "Map", username: widget.username, worldname: widget.worldname,),
                ),
              );
            },
            tooltip: "Map",
            child: const Icon(Icons.map),
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
                  builder: (context) =>
                      ShopPage(title: 'Shop', username: widget.username, worldname: widget.worldname,),
                ),
              );
            },
            tooltip: 'Shop',
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
                  builder: (context) => CreatorsPage(title: 'Creators Hub', username: widget.username, worldname: widget.worldname),
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
