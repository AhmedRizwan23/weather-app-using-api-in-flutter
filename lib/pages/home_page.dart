import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  TextEditingController searchfromuser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map getvaluesfromloadingpagearguments =
        ModalRoute.of(context)!.settings.arguments as Map;
    //here this line get the values from the loading page arguments as Map,

//assigning values which we getting from api to loading page and from loading page to here
    dynamic temphome =
        getvaluesfromloadingpagearguments["gett_temp"].toString();
    dynamic airSpdhome = getvaluesfromloadingpagearguments["gett_airspeed"]
        .toString()
        .substring(0, 4);
    //substring to show desire decimal point
    dynamic humidityhome = getvaluesfromloadingpagearguments["gett_hum"];

    String weathericon =
        getvaluesfromloadingpagearguments["gett_icon"].toString();
    String locationhomepage =
        getvaluesfromloadingpagearguments["gett_location"];
    String descriptionhomepage =
        getvaluesfromloadingpagearguments["gett_description"];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [
              0.1,
              0.5,
            ],
                colors: [
              Colors.blue.shade800,
              Colors.blue.shade300,
            ])),
        child: Column(
          children: [
            Container(
                height: 40,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //here navigator send the value of whatever user searches to loading screen
                        Navigator.pushNamed(context, "Loadingpage", arguments: {
                          "searched_text": searchfromuser.text,
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          )),
                    ),
                    Expanded(
                      child: TextField(
                        //this controller will get the string which is written in text field
                        controller: searchfromuser,

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search any city name",
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              width: 400,
              height: 140,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                      "https://openweathermap.org/img/wn/$weathericon@2x.png"),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        descriptionhomepage,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "in $locationhomepage",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 230,
                width: 400,
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      WeatherIcons.thermometer,
                      size: 24,
                      color: Colors.red[500],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          temphome,
                          style: const TextStyle(fontSize: 80),
                        ),
                        const Text(
                          "C",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 200,
                    width: 225,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [Icon(WeatherIcons.day_windy)],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          airSpdhome,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text("Km/h")
                      ],
                    )),
                Container(
                    height: 200,
                    width: 225,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              WeatherIcons.humidity,
                              color: Colors.blue.shade900,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          humidityhome,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text("Percent")
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Made by Ahmed",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Data provided by Openweather.org",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
