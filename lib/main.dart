import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmist/ui/detection/detect_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:farmist/ui/auth/LoginScreen.dart';
import 'package:farmist/ui/auth/RegScreen.dart';
import 'package:farmist/ui/home/home_screen.dart';
import 'package:farmist/ui/information/item_detales.dart';
import 'package:farmist/ui/providers/list_provider.dart';
import 'package:farmist/ui/weather/weather_screen.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  // await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(
    create: (_){
      return ListProvider();
    },
    child: MyApp(), 
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        WeatherScreen.routeName:(context) => WeatherScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ItemDetalis.routeName:(context) => ItemDetalis(),
        LoginScreen.routeName:(_) => LoginScreen(),
        RegScreen.routeName:(_) => RegScreen(),
        LoginScreen.routeName:(_) => LoginScreen(),
        DetectingScreen.routeName:(_)=> DetectingScreen(title: "title")
      },
    ));


  }

}
