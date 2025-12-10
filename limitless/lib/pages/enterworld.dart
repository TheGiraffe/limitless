import 'package:flutter/material.dart';
import 'package:Limitless/types.dart';
import '../components/options.dart';
import '../components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../interactiveitem.dart';

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
  // TODO: Create a series class that passes along items to the world, etc.
  dynamic _item = { "itemPath":'assets/images/pngs/weird/randomvoid.png',
                              "gestureText": "You fell into the void and became one with the universe.",
                              "gestureButtomText": "Reincarnate Me"
                            };
  dynamic _item2 = { "itemPath":'assets/images/pngs/potions/sheep-serum.png',
                              "gestureText": "This is sheep serum.",
                              "gestureButtomText": "Collect sheep serum."
                            };

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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return _World(constraints.maxHeight, constraints.maxWidth);
        },
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ), // Remove this worldname stuff later?
    );
  }

  Widget _World(double maxHeight, double maxWidth){
      void _moveCharacter(details) {
                                character_x = details.globalPosition.dx - 60;
                            character_y = details.globalPosition.dy - (maxHeight*(5/16));
                            print(details.globalPosition.dx);
                            if (details.globalPosition.dx > 350 && _terrainAlignmentStart < 0.99){
                              print("show next!");
                              show_next = true;
                            } else if (details.globalPosition.dx < 50 && _terrainAlignmentStart > -0.99){
                              print("show prev!");
                              show_prev = true;
                            } else {
                              show_next = false;
                              show_prev = false;
                            }
  }
  print(maxHeight);
  print(maxWidth);
  return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
            padding: EdgeInsets.all(10),
            child:Text("This is where you can interact with your world!")),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(height: maxHeight/8,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            show_prev ? ElevatedButton(onPressed: () => _moveTerrain("left"), child: Text("<< BACK")) : Container(),
                            show_next ? ElevatedButton(onPressed: () => _moveTerrain("right"), child: Text("CONTINUE >>")) : Container(),
                          ],),
                    ),
                    Transform.scale(
                      scale: 2,
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                      height: maxHeight/8 - 16,
                      width: 1000,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment(_terrainAlignmentStart, 0),
                        child: ImageIcon(
                          AssetImage(
                          planetTypes[widget
                                  .userInfo
                                  .worldtype]!["terrain-backdrop"] ??
                              "assets/images/png/planets/craterplanet_terrain_backdrop.png",
                          ),
                        ),
                      ),
                    )),
                    GestureDetector(
                        onTapDown: (details) => {
                          setState(() {
                            _moveCharacter(details);
                          }),
                        },
                        child: Container(
                          height: maxHeight - maxHeight*(5/16),
                          color: Color.fromRGBO(32, 32, 32, 1),
                          child: GridView.count(
                            primary: false,
                            crossAxisCount: 4,
                            // TODO: Create a method to build up this grid.
                            children: [
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item2),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item2),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item2),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item),
                              InteractiveItem(item: _item2),
                              InteractiveItem(item: _item),
                            ],
                          )
                        )
                      ),
                  ],
                ),
                AnimatedPositioned(
                  top: character_y,
                  left: character_x,
                  duration: Duration(seconds: 1),
                  child: SizedBox(
                    height: maxHeight/8,
                    child: FittedBox(
                      child: ImageIcon(
                          AssetImage(
                        outfitTypes[widget.userInfo.outfittype] ??
                            'assets/images/pngs/characters/self/default.png',
                          )
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: maxHeight/24,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment(_terrainAlignmentStart, 0),
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
              ],
            ),
          ],
        );
}
}

