import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: 
      TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 220, 219, 219),
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon:
                  Icon(Icons.search, color: Color(0xff7c7c7c)),
            ),
          ),


    );
  }
}

