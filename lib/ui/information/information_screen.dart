import 'package:flutter/material.dart';

import 'package:farmist/ui/information/card_widget.dart';

class InformationScreen extends StatelessWidget {
  List<String> names = [ "خيار " ," باميا " , "كوسه " , " بازلاء " , " فلفل " , " ليمون " ," كرنب " , " بصل " , "بطاطس " , "طماطم " , "جزر " , " باذنجان ", " مانجو " , " جوافه " , " تين " , "كمثري" , " مشمش " , " خوخ " , " اناناس " , " بطيخ " ,  ] ;
  List<String> imageName = ['0' , '1' , '2' , '3' , '4' , '5' , '6' , '7' , '8' , '9' , '10' ,'11' , '12' , '13' , '14' , '15' , '16' , '17' , '18' , '19' , '20' , '21' , '22' , '23' , '24' ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff104417),
        //Color.fromRGBO(32, 220, 45, 100)
        title: Center(child: Text("معلومات"  , style: TextStyle(fontSize: 30),)),
      ),
      body: Column(
        children: [
          Center(child: Image.asset('assets/images/logo.jpg' , height: 150,)),
          Divider(
            color: Color.fromRGBO(32, 220, 45, 100),
            thickness: 4,
          ),
          Container(child: Text("read about " , style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold) , textAlign: TextAlign.center) , width: double.infinity, color: Color(0xff104417)),
          Divider(
            color: Color.fromRGBO(32, 220, 45, 100),
            thickness: 5,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context , index){
                  return Center(child: CardWidget(name: names[index], index: index, imageName: imageName[index],));
                },
                separatorBuilder: (context , index){
                  return  Divider(
                    color: Color.fromRGBO(32, 220, 45, 100),
                    thickness: 3,
                  );
                },
                itemCount: names.length),
          )
        ],
      ),
    );
  }
}
