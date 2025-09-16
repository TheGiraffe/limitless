import 'package:flutter/material.dart';
import '../pages/map.dart';
import '../pages/shop.dart';
import '../pages/creators.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({
    super.key,
    required this.userInfo
  });
  final dynamic userInfo;
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
            heroTag: "Worldview",
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            tooltip: 'Worldview',
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
                  builder: (context) => MapPage(title: "Map", userInfo: widget.userInfo),
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
                      ShopPage(title: 'Shop', userInfo: widget.userInfo),
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
                  builder: (context) => CreatorsPage(title: 'Creators Hub', userInfo: widget.userInfo),
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
