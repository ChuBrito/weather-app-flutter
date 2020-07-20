import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future getData(url) async {
    http.Response response = await http.get(url).then((response) => response);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return throw (response.body);
    }
  }
}
