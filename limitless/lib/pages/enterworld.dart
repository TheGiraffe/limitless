import 'package:flutter/material.dart';
import 'package:limitless/types.dart';
import '../components/options.dart';
import '../components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterWorld extends StatefulWidget {
  const EnterWorld({super.key, required this.userInfo});

  final dynamic userInfo;

  @override
  State<EnterWorld> createState() => _EnterWorldState();
}

class _EnterWorldState extends State<EnterWorld> {
  double _terrainAlignmentStart = -0.99;
  double character_x = 20;
  double character_y = 500;
  bool show_next = false;
  bool show_prev = false;

  void _moveTerrain(direction) {
    if (direction == "right"){
      _terrainAlignmentStart = _terrainAlignmentStart + 0.5;
    }
    if (direction == "left"){
      _terrainAlignmentStart = _terrainAlignmentStart - 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.userInfo.worldname),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("This is where you can interact with your world!"),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(height: 50,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            show_prev ? ElevatedButton(onPressed: () => _moveTerrain("left"), child: Text("<< BACK")) : Container(),
                            show_next ? ElevatedButton(onPressed: () => _moveTerrain("right"), child: Text("CONTINUE >>")) : Container(),
                          ],),
                    ),
                    SizedBox(
                      height: 400,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment(_terrainAlignmentStart, 0),
                        child: SvgPicture.asset(
                          planetTypes[widget
                                  .userInfo
                                  .worldtype]!["terrain-backdrop"] ??
                              "assets/images/svgs/planets/craterplanet_terrain_backdrop.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTapDown: (details) => {
                          setState(() {
                            character_x = details.globalPosition.dx - 40;
                            character_y = details.globalPosition.dy - 180;
                            print(details.globalPosition.dx);
                            if (details.globalPosition.dx > 500 && _terrainAlignmentStart < 0.99){
                              print("show next!");
                              show_next = true;
                            } else if (details.globalPosition.dx < 50 && _terrainAlignmentStart > -0.99){
                              print("show prev!");
                              show_prev = true;
                            } else {
                              show_next = false;
                              show_prev = false;
                            }
                          }),
                        },
                        child: Container(
                          height: 450,
                          color: Color.fromRGBO(32, 32, 32, 1),
                        )
                      ),
                  ],
                ),
                AnimatedPositioned(
                  top: character_y,
                  left: character_x,
                  duration: Duration(seconds: 1),
                  child: SizedBox(
                    height: 120,
                    child: FittedBox(
                      child: SvgPicture.asset(
                        outfitTypes[widget.userInfo.outfittype] ??
                            'assets/images/svgs/characters/self/default.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 400,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment(_terrainAlignmentStart, 0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: SvgPicture.asset(
                          planetTypes[widget
                                  .userInfo
                                  .worldtype]!["terrain-foreground"] ??
                              "assets/images/svgs/planets/craterplanet_terrain_foreground.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ), // Remove this worldname stuff later?
    );
  }
}
