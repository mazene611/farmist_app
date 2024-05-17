//import 'package:farm_app/Screens/CardsWidget.dart';
import 'package:farmist/ui/auth/LoginScreen.dart';
import 'package:farmist/ui/home/drawer_screen.dart';
import 'package:farmist/ui/information/item_detales.dart';
import 'package:farmist/ui/weather/weather_screen.dart';
import 'package:flutter/material.dart';
//import 'package:farm_app/Screens/HomeSearch.dart';



class BaseHomeScreen extends StatelessWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 255, 255, 255),


      appBar: AppBar(


        backgroundColor: Color(0xff104417),
        elevation: 2,
        title: const Center(
            child:
            Text(
              ' HOME ',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            )
        ),
        actions: [
          IconButton(onPressed:(){Navigator.pushNamed(context, WeatherScreen.routeName);}, icon: Icon(Icons.cloudy_snowing),iconSize: 40,color: Colors.white,),SizedBox(width: 10,),
          IconButton(onPressed:(){Navigator.pushNamed(context, LoginScreen.routeName);}, icon: Icon(Icons.logout),iconSize: 40,color: Colors.white,),SizedBox(width: 10,),
        ],
      ),

      drawer: DrawerScreen(),


      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.all( 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 220, 219, 219),
                    filled: true,
                    hintText: 'Search....',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon:
                    Icon(Icons.search, color: Color(0xff7c7c7c)),
                  ),

                ),
              ),

              SizedBox(height: 10,),

              Text('Seeds or needs?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff104417),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Image.asset('assets/images/homimages/seeds.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 10,),

              Text('Most popular',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff104417),
                ),
              ), Text('These plants are recommended for you', style: TextStyle(fontSize: 17),),

              SizedBox(height: 20,),

              Container(
                height: 220.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        Navigator.of(context).pushNamed(ItemDetalis.routeName,
                            arguments: ItemDetalisArgs(name: "name" , index: 3 ,imageName: "0"  ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff104417),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        padding: EdgeInsets.all(10.0),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/homimages/apple.jpg', width: 130, height: 120),
                          SizedBox(height: 10),
                          Text('Apple',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'Arial',
                            ),),
                        ],
                      ),

                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff104417),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/homimages/banana.png',width: 130, height: 120),
                          SizedBox(height: 10),
                          Text('Banana',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'Arial',
                            ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff104417),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/homimages/guava.png', width: 130, height: 120),
                          SizedBox(height: 10),
                          Text('Guava',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff104417),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/homimages/mango.png',width: 130, height: 120),
                          SizedBox(height: 10),
                          Text('Mango',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff104417),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/homimages/orange.png',width: 130, height: 120),
                          SizedBox(height: 10),
                          Text(
                            'Orange',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          ' View All > ',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff104417),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}
