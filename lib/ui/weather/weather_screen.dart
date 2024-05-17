//import 'package:farm_app/Constants/Colors.dart';

import 'package:flutter/material.dart';
import 'package:farmist/ui/weather/CurrentDay.dart';
import 'package:farmist/ui/weather/NextDays.dart';
import 'package:farmist/ui/weather/search_box.dart';
//import 'package:flutter/widgets.dart';

class WeatherScreen extends StatefulWidget {
  static const String routeName = "Weather Screen";
  const WeatherScreen({super.key});
  
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar( 
          backgroundColor: Color(0xff104417),
          elevation: 0,
         
          
        ),
      body: Container(
        width: double.infinity,
        color:  Color(0xff104417),
        /*decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          )
        ),*/
      
      child: const SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        
        children: [
          Spacer(),
          SearchBox(),
          Spacer(),
          CurrentDay(),
          Spacer(),
          NextDays(),     
          SizedBox(height: 70,),

      ],)),
      ),
    );
  }
}