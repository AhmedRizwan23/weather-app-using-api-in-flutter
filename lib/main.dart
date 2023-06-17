import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/": (context) => const Loading(),
        "home": (context) => const Home(),
        "Loadingpage":(context) => Loading()
      },
    );
  }
}
