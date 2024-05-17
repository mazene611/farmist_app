import 'package:farmist/models/app_user.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 138, 146, 152),
            ),
            child: 
            Row(
              children: [
                Icon(Icons.account_circle_rounded,size: 75,color: Colors.white,),
                Text(
                  ' Welcom \n ${AppUser.currentUser!.username}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Add your onTap logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Add your onTap logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Add your onTap logic here
            },
          ),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoriate'),
            onTap: () {
                // Add your onTap logic here
            },
          ),

          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help Center'),
            onTap: () {
              // Add your onTap logic here
             },
          ),
        
          SizedBox(height: 300),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              // Add your onTap logic here
             },
          ),
        ],
      ),
    );
  }
}
