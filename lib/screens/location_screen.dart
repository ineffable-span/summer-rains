import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;

  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature;
  String cityName;
  String suggestion;

  @override
  void initState() {
    super.initState();
    double temp = widget.weatherData['list'][0]['main']['temp'];
    temperature = temp.toInt();
    cityName = widget.weatherData['list'][0]['name'];
    suggestion = widget.weatherData['list'][0]['weather'][0]['description'];
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.near_me,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    iconSize: 50.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    iconSize: 50.0,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "It's 🍦 time in $cityName!",
                    textAlign: TextAlign.right,
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
