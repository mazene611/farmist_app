import 'package:flutter/material.dart';
import 'package:farmist/ui/information/item_detales.dart';

class CardWidget extends StatelessWidget {
  static String routeName = "CardWidget";
  String name;
  String imageName;
  int index;
  CardWidget({required this.name , required this.index , required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.78, // Adjust the opacity value (0.0 to 1.0)
            child: Image(
              image: ResizeImage(
                AssetImage("assets/images/cards/${imageName}.jpg"),
                width: 400,
                height: 300,
              ),
            ),
          ),
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ItemDetalis.routeName,
                    arguments: ItemDetalisArgs(name: name , index: index ,imageName: imageName  )
                );
              }
              ,child: Text(name , style: TextStyle(fontSize: 54 , color: Colors.white , fontWeight: FontWeight.bold ))),

        ],
      ),
    );
  }
}
