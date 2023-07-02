import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screen/homepage.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Vishal maurya'),
              accountEmail: Text('vishalsrgp0041@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/login.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
              ),
              title: Text('profile'),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
              onTap: () {
                Navigator.pushNamed(context, '/card');
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Logout'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
