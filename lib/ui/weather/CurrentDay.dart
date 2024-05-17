import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
class CurrentDay extends StatefulWidget {
  const CurrentDay({super.key});

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('City',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight:FontWeight.w900,
        ),),
        Image.network("https://openweathermap.org/img/wn/10d@2x.png",width: 120,height: 120),
        Text('27 C',
        style: TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight:FontWeight.w500,
        ),),
      ],
    );
  }
}