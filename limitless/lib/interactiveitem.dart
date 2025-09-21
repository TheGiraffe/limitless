import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteractiveItem extends StatefulWidget {
  const InteractiveItem({super.key, required this.item});
  final dynamic item;

  @override
  State<InteractiveItem> createState() =>  _InteractiveItemState();
}

class _InteractiveItemState extends State<InteractiveItem>{
  @override
  Widget build(BuildContext context){
    return(
      Container(
        child: FittedBox(
          child: GestureDetector(
            onTap: () => {
              print(widget.item["gestureText"])
            },
            child: SvgPicture.asset(
              widget.item["itemPath"] ?? 'assets/images/svgs/weird/randomvoid.svg',
              fit: BoxFit.cover,
            ),
          ),
        )
      )
    );
  }
}