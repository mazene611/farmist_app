import'package:flutter/material.dart';

class NextDays extends StatefulWidget {
  const NextDays({super.key});

  @override
  State<NextDays> createState() => _NextDaysState();
}

class _NextDaysState extends State<NextDays> {
  @override
  Widget build(BuildContext context) {
    return SizedBox( height: 200,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return item();
        }
      ),
    );
  }
}


Widget item(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Day',
        style: TextStyle(
          color: Colors.white, fontSize: 17,
          ),
        ),

        Image.network("https://openweathermap.org/img/wn/10d@2x.png",width: 120,height: 120),    
        const SizedBox(height: 5),
        const Text('27 C',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight:FontWeight.w500,
        ),),
    
    ],
  );
}
