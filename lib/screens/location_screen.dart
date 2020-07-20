import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/location.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  LocationScreen(this.locationData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var locationData;
  int temperature = 0;
  String cityName = '';
  String condition = '';
  String messageText = '';

  @override
  void initState() {
    updateUI(widget.locationData);
    super.initState();
  }

  updateUI(dynamic currentData) {
    if (currentData == null) {
      messageText = 'We had a problem, try again';
      return;
    } else {
      setState(() {
        var temp = currentData['main']['temp'];
        var cond = currentData['weather'][0]['id'];
        temperature = temp.round();
        cityName = currentData['name'];
        condition = WeatherModel().getWeatherIcon(cond);
        messageText = WeatherModel().getMessage(temperature);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      var newLocationData = Location().getWeather();
                      updateUI(newLocationData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        setState(() {
                          cityName = typedName;
                        });
                        var newLocationData = Location().getWeather();
                        updateUI(newLocationData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$temperature',
                        style: kTempTextStyle,
                      ),
                      Text(
                        condition,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    cityName.length > 0
                        ? '$messageText in $cityName'
                        : '$messageText',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
