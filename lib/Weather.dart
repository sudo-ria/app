import 'package:flutter/material.dart';

class Weather {
  final int temp;
  final int humidity;
  final double pressure;

  Weather(
  {
    required this.temp,
    required this.humidity,
    required this.pressure
}
      );

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temp: json['temp'],
      humidity: json['humidity'],
      pressure: json['pressure']
    );
  }
}