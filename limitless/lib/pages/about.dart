import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../components/options.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatefulWidget{
  const AboutPage({super.key, required this.userInfo});
  final dynamic userInfo;
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("About Limitless"),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo,),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/svgs/about-limitless-img.svg', fit: BoxFit.fitWidth),
            Padding(padding: EdgeInsetsGeometry.only(bottom: 25, left: 50, right: 50),
            child: Text("Limitless is a project started in 2025 with the mission of making world-class educational content accessible, fun, and engaging by emulating RPG / game design patterns.",
            textAlign: TextAlign.center,),),
            Text("Authors: Sophia Davis", textAlign: TextAlign.center,),
            
            ],
        ),
        )
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
      ),
  );
  }
}