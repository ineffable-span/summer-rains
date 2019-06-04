import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  void getLocationData() async {
    Location location = Location();

    await location.getLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkingServices networkingServices = NetworkingServices(
        url:
            'http://api.openweathermap.org/data/2.5/find?lat=${location.latitude}' +
                '&lon=${location.longitude}&appid=$kAppId&units=metrics');

    var receivedData = await networkingServices.getWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: receivedData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
