import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screen/card_menu.dart';
import 'package:flutter_application_2/Screen/homepage.dart';
import 'package:flutter_application_2/Screen/register.dart';
import 'package:flutter_application_2/Screen/loginpage.dart';
import 'package:flutter_application_2/Screen/notification.dart';
import 'package:flutter_application_2/Screen/scroll.dart';
//import 'package:flutter_application_2/model.dart';
//import 'package:flutter_application_2/Screen/model.dart';
import 'package:flutter_application_2/Screen/slider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/login': (context) => LoginPage(),
        '/callme': (context) => NotificationScrren(),
        '/register': (context) => Register(),
        '/news': (context) => Register(),
        '/slider': (context) => dropdown_menu(),
        '/logout': (context) => Card_menu(),
        '/add': (context) => Scroll_menu(),
      },
    ));
