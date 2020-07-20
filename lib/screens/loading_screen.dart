import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List weatherData;

  getLocation() async {
    weatherData = await Location().getCurrentLocation();
  }

  nextScreen() async {
    var locationWetherData = await Location().getWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWetherData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SpinKitDualRing(color: Colors.grey),
    );
  }
}
