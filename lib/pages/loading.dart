import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  dynamic temp = "";
  String hum = "";
  dynamic airspeed = "";
  String descrption = "";
  String main = "";
  dynamic showinglocation = "Lahore";
  String tempratureicon = "";
  // dynamic city = "Lahore";

  void startapp(String showinglocation) async {
    dynamic instance = Worker(location: showinglocation);
    await instance.getdata();
    //to round the decimal point of temprature in clesius
    dynamic temp = instance.temCelsius.toString().substring(0, 4);

    hum = instance.humidity;
    airspeed = instance.airspeed;
    descrption = instance.description;
    main = instance.main;

    tempratureicon = instance.iconfortemprature;

    //the navigator is used to switch a screen to homepage and arguments are used to make map of values getting from api
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "home", arguments: {
        "gett_temp": temp,
        "gett_hum": hum,
        "gett_airspeed": airspeed,
        "gett_description": descrption,
        "gett_main": main,
        "gett_location": showinglocation,
        "gett_icon": tempratureicon,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //this line get the value of searchfromuser value pass as map from searchbox from home
    Map? searchfromhome = ModalRoute.of(context)?.settings.arguments as Map?;
    if (searchfromhome?.isNotEmpty ?? false) {
      showinglocation = searchfromhome!["searched_text"];
    }
    startapp(showinglocation);

    return Scaffold(
        backgroundColor: Colors.blue.shade800,
        body: Center(
          child: Column(
            children: const [
              Image(
                image: AssetImage("lib/assets/mlogo.png"),
              ),
              Text(
                "Climate App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Made by Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 80,
              ),
              SpinKitSpinningLines(
                color: Colors.white,
                size: 100.0,
              ),
            ],
          ),
        ));
  }
}
