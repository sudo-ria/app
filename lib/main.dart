

import 'package:flutter/material.dart';
import 'package:untitled/Weather.dart';
import './ui/weatherApp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new WeatherApp(),
    );
  }
}



