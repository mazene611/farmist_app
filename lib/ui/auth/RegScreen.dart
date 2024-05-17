import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmist/models/app_user.dart';
import 'package:farmist/ui/auth/LoginScreen.dart';
import 'package:farmist/ui/home/home_screen.dart';
import 'package:farmist/ui/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  static const String routeName = "RegScreen";

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  bool _passwordVisible = false;
  String email = "";
  String password = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homimages/SplashView.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color(0x91a7a6a6),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onChanged: (text){
                        username = text;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff104417),
                        ),
                      ),
                    ),
                    TextFormField(
                      onChanged: (text){
                        email = text;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: ' Gmail',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff104417),
                        ),
                      ),
                    ),
                    TextFormField(
                      onChanged: (text){
                        password = text;
                      },
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff104417),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        register();
                       // Navigator.pushNamed(context, 'HomeScreen');
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff104417),
                        minimumSize: Size(150.0, 60.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text('SIGN UP',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xffffffff),
                            fontFamily: 'Arial',
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'If you already have an account ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xd9ffffff),
                          ),
                        ),
                        InkWell(
                          onTap: () {Navigator.pushNamed(context, LoginScreen.routeName);},
                          child: Text(" SIGN IN",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Color.fromARGB(255, 49, 4, 247),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void register() async{
    try{
      showLoadig(context);
      UserCredential userCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      AppUser newUser = AppUser(id: userCredential.user!.uid, email: email, username: username);
      await registerUserInFireSotre(newUser);
      AppUser.currentUser = newUser;
      hideLoading(context);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }on FirebaseAuthException catch(error){
      hideLoading(context);
      showError(context , error.message ??
          "Something went wrong . Please try later ");

    }

  }

  Future registerUserInFireSotre(AppUser user) async{
    CollectionReference<AppUser> userCollection = AppUser.collection();
    await userCollection.doc(user.id).set(user);
    // userCollection.add(user);



    // userCollection.add({
    //   "id" : user.id,
    //   "email" : user.email,
    //   "username" : user.username,
    // });
  }
}
