import 'dart:convert';
import 'package:http/http.dart' as http;

class Worker {
  dynamic temp = "";
  dynamic temCelsius;
  String humidity = "";
  dynamic airspeed = "";
  String description = "";
  String main = "";
  dynamic timezone;
  var toshowlocation = "";
  dynamic iconfortemprature;
//getting city name
  String location = "";

  //constructor
  Worker({required this.location}) {
    // ignore: unnecessary_this
    location = this.location;
  }

  Future<void> getdata() async {
    try {
      var response = await http.Client().get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1af5ffff4e3e1675f012193ef48083de"));
      Map convertdata = jsonDecode(response.body);
//getting time zone
      int realTimezone = convertdata["timezone"];
      dynamic getTimezone = realTimezone;
      // getting temprature,

      Map temprature = convertdata["main"];
      dynamic getRealtemp = temprature["temp"];
      // getting humidity
      Map ghumidity = convertdata["main"];
      dynamic getRealhumidity = ghumidity["humidity"];

      //getting wind speed and  division converts it into Km/h,
      Map windSpeed = convertdata["wind"];
      dynamic getSpeed = windSpeed["speed"] / 0.27777777777778;

      //getting description
      List intolist = convertdata["weather"];
      Map intoIndex = intolist[0];

      String getMaindescription = intoIndex["main"];

      String getDesc = intoIndex["description"];
      //getting icon
      List geticon = convertdata["weather"];
      Map fromgeticon = geticon[0];
      String geticoncode = fromgeticon["icon"];
      

      //Assigning values
      temp = getRealtemp;
      //converting kelvin to celsius

      temCelsius = temp - 273.15;
      humidity = getRealhumidity.toString();
      airspeed = getSpeed;
      main = getMaindescription;
      description = getDesc;
      timezone = getTimezone;
      iconfortemprature=geticoncode;
      
    } catch (e) {
      temCelsius = "cant find data!";
      humidity = "cant find data!";
      airspeed = "cant find data!";
      main = "cant find data!";
      description = "cant find data!";
      timezone = "cant find data!";
      toshowlocation = "cant find location";
      iconfortemprature="cant find icon";
    }
  }
}
