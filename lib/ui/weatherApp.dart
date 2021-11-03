import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  //const WeatherApp({Key? key}) : super(key: key);
  @override
  _WeatherAppState createState() => new _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  void showStuff() async {
   Map data = await getWeather(util.appId, util.defaultCity);
   print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WeatherApp'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(onPressed: showStuff,
              icon: new Icon(Icons.menu,
              color: Colors.white,))
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text('Spokane',
            style: cityStyle(),),
          ),
          new Container(
            //margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            alignment: Alignment.center,
            child: updateTempWidget('Beira'),
          )
        ],
      ),
    );
  }
  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.appId}&units=metric';
    http.Response response = await http.get(Uri.parse(appId));

    return jsonDecode(response.body);
  }
  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.appId, city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map ? content = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(content!['main']['temp'].toString(),
                    style: new TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 49.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),),
                  )
                ],
              ),
            );
          }else {
            return new Container(

            );
          }
        });
  }
}

TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.black,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle() {
  return new TextStyle(
      color: Colors.black,
      fontSize: 49.9,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
}
