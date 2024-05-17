import 'package:flutter/material.dart';

class InformationDetales extends StatelessWidget {
  static String routeName = "InformationDetales";
  String name;
InformationDetales({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(name , style: TextStyle(fontSize: 26 ), textAlign: TextAlign.center,),
    );
  }
}
