import 'package:flutter/material.dart';
import '../components/options.dart';
import '../components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterWorld extends StatefulWidget {
  const EnterWorld({
    super.key,
    required this.worldname,
    required this.username
  });
  
  final String worldname;
  final String username;

  @override
  State<EnterWorld> createState() => _EnterWorldState();
}

class _EnterWorldState extends State<EnterWorld>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.worldname),
      ),
      drawer: MyDrawerWidget(username: widget.username, worldname: widget.worldname),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("This is where you can interact with your world!"),
Expanded(
                  child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnterWorld(
                                  worldname: widget.worldname,
                                  username: widget.username,
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/svgs/squares/sq1.svg',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                
            ],
        ),
      ),
      floatingActionButton: OptionsWidget(
        worldname: widget.worldname, username: widget.username,
      ), // Remove this worldname stuff later?
    );
  }
}