import 'package:farmist/ui/detection/detect_screen.dart';
import 'package:flutter/material.dart';
import 'package:farmist/ui/home/base_home.dart';
import 'package:farmist/ui/home/setting_tap.dart';
import 'package:farmist/ui/information/information_screen.dart';
import 'package:farmist/ui/weather/weather_screen.dart';

import '../todo/todo_tap.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color.fromRGBO(32, 220, 45, 100),
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home) , label: "" , backgroundColor: Color(0xff104417)),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp) , label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.add) , label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.abc_rounded) , label: ""),
              // BottomNavigationBarItem(icon: Icon(Icons.access_alarm) , label: ""),

            ]),
      body: tap[selectedIndex]
    );
  }
  List<Widget> tap = [
    BaseHomeScreen(),
    DetectingScreen(title: "title"),
    InformationScreen(),
    TodoScreen(),
    // HomeScreenFarm(),
  ];
}

