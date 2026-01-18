import 'package:flutter/material.dart';
import '../uicomponents/drawer.dart';
import '../uicomponents/options.dart';

// This file will do most of the reading and writing of user data from the database.

class UserInfo {
  late String username;
  late String worldname;
  late String worldtype;
  late String outfittype;
  UserInfo({required this.username, required this.worldname, required this.worldtype, required this.outfittype});
}

// This here is still a work in progress... Soon it might be time to start reading and writing from a database.
// var currentUserProfile = UserInfo(
//           username: "TheBestUser",
//           worldname: "FabulousWorldtopolis",
//           worldtype: "Crater Planet",
//           outfittype: "Galaxy"
//         );

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.userInfo});
  final dynamic userInfo;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Settings"),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo,),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("This is the Settings Page")],
        ),
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ),
    );
  }
}