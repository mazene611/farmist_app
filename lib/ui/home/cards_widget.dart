import 'package:flutter/material.dart';
import 'package:farmist/ui/information/card_widget.dart';
import 'package:farmist/ui/information/information_detales.dart';
import 'package:farmist/ui/information/item_detales.dart';
import 'package:farmist/ui/weather/weather_screen.dart';

class CardsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SingleChildScrollView(
          child: ElevantButton(
            image: 'assets/images/homimages/apple.jpg',
            text: 'Apple',
            onTap:() {  },
          ),
        ),
        SingleChildScrollView(
          child: ElevantButton(
            image: 'assets/images/homimages/banana.png',
            text: 'Banana',
            onTap: () {  },
          ),
        ),
        SingleChildScrollView(
          child: ElevantButton(
            image: 'assets/images/homimages/orange.png',
            text: 'Orange',
            onTap: () {  },
          ),
        ),
        SingleChildScrollView(
          child: ElevantButton(
            image: 'assets/images/homimages/guava.png',
            text: 'Guava',
            onTap: () {  },
          ),
        ),
        SingleChildScrollView(
          child: ElevantButton(
            image: 'assets/images/homimages/mango.png',
            text: 'Mango',
            onTap: () {
              Navigator.of(context).pushNamed(ItemDetalis.routeName,
                  arguments:ItemDetalisArgs(name: "خيار " , index: 0 ,imageName: "assets/images/cards/0.jpg" ));

            },
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              ' View All > ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                color: Color.fromRGBO(32, 220, 45, 100),
              ),
            ),
          ),
        ),

      

              
      ],
    ),
    );
  }
}


////////////////////////////////////////////////////////////

class ElevantButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;


  ElevantButton({required this.image, required this.text, required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 255,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 110,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff104417),
            spreadRadius: 5,
          ),
        ],
      ),
    ),
    );
  }
}
