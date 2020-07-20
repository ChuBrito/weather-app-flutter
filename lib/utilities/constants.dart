import 'package:flutter/material.dart';

const String kApiKey = '91b1e59ceca34904c1db2f3a709a7ffd';
const String kUrlBase = 'http://api.openweathermap.org/data/2.5/weather?lat=';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMinTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 15.0,
);

const kIputFieldDecoration = InputDecoration(
  filled: true,
  icon: Icon(Icons.location_city),
  hintText: 'Location',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
