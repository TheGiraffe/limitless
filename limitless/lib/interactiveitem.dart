import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteractiveItem extends StatefulWidget {
  const InteractiveItem({super.key, required this.item});
  final dynamic item;

  @override
  State<InteractiveItem> createState() => _InteractiveItemState();
}

class _InteractiveItemState extends State<InteractiveItem> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      child: FittedBox(
        child: GestureDetector(
          onTapDown: (details) => {
            setState(() {
              // print(widget.item["gestureText"]);
            }),
          },
          child: ImageIcon(
            AssetImage(
              widget.item["itemPath"] ??
                  'assets/images/pngs/weird/randomvoid.png',
            ),
          ),
        ),
      ),
    ));
  }
}
