import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingServices {
  String url;

  NetworkingServices({this.url});


  Future getWeatherData() async{
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error code encountered.');
      return null;
    }
  }
}