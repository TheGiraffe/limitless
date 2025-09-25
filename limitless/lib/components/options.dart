import 'package:flutter/material.dart';
import '../pages/map.dart';
import '../pages/shop.dart';
import '../pages/creators.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key, required this.userInfo, this.addedPadding});
  final dynamic userInfo;
  final double? addedPadding;
  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  final double _actionButtonPadding = 8;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "Inventory",
            onPressed: () {
              print(ModalRoute.of(context)?.settings.name);
            },
            tooltip: "Inventory",
            child: const Icon(Icons.inventory),
          ),
        ),
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "Map",
            onPressed: () {
              Navigator.pushNamed(context, '/map');
              print(ModalRoute.of(context)?.settings.name);
            },
            tooltip: "Map",
            child: const Icon(Icons.map),
          ),
        ),
        ModalRoute.of(context)?.settings.name == "/" ?
        Container() :
        Container(
          padding: EdgeInsets.all(_actionButtonPadding),
          child: FloatingActionButton(
            heroTag: "Worldview",
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            tooltip: 'Worldview',
            child: const Icon(Icons.language),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: widget.addedPadding ?? 0),
        ),
      ],
    );
  }
}
