import 'package:geolocator/geolocator.dart';
import '../utilities/constants.dart';
import 'networking.dart';

class Location {
  getWeatherByCityName(String name) async {
    String url =
        'api.openweathermap.org/data/2.5/weather?q=$name&appid=$kApiKey';
    try {
      var wData = await Networking().getData(url);
      return wData;
    } catch (e) {
      return throw (e);
    }
  }

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.best);

      List data = new List();
      data.addAll([position.longitude, position.latitude, position.timestamp]);
      return data;
    } catch (e) {
      return throw (e);
    }
  }

  getWeatherData(double lon, double lat) async {
    try {
      String url =
          '$kUrlBase${lat.toString()}&lon=${lon.toString()}&appid=$kApiKey&units=metric';
      var wData = await Networking().getData(url);
      return wData;
    } catch (e) {
      return throw (e);
    }
  }

  getWeather() async {
    try {
      List weatherData = await getCurrentLocation();
      var locationWetherData =
          await getWeatherData(weatherData[0], weatherData[1]);
      return locationWetherData;
    } catch (e) {
      return throw (e);
    }
  }
}
