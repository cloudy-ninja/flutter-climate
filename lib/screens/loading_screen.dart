import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = 'b1b41feadf39a18db8181ee9c6e260d7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getGeolocationData();
  }

  void getGeolocationData() async {
    print('ok');
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkingHelper networking = NetworkingHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networking.getData();
    print(weatherData['main']['temp']);

    // double temperature = weatherData['main']['temp'];
    // int condition = weatherData['weather'][0]['id'];
    // String cityName = weatherData['name'];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  // void getData() async {
  //   ('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b41feadf39a18db8181ee9c6e260d7');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
