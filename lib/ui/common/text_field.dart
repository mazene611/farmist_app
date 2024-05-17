import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  String? hintText ;
  TextEditingController controller;
  MyTextFeild({this.hintText , required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
