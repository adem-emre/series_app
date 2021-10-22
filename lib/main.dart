import 'package:flutter/material.dart';
import 'package:series_app/consts.dart';

import 'screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Series App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: mainBgColor
        )
      ),
      home: MainPage(),
    );
  }
}

