import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'constants.dart';

class ErrorHandler extends StatelessWidget {
  final String message;
  ErrorHandler(this.message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message, style: kMinTextStyle),
      content: null,
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
            Location().getWeather();
          },
        ),
      ],
    );
  }
}
