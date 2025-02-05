import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  String _cityName = ' ';
  String _temperature = ' ';
  String _weatherCondition = ' ';

  void _fetchWeather(){
    String city = _cityController.text;
    Random random = Random();
    int temperature = 15 + random.nextInt(16);
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    String condition = conditions[random.nextInt(conditions.length)];
    setState((){  
      _cityName = city;
      _temperature = '$temperature°C';
      _weatherCondition = condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Weather Condition: $_weatherCondition',
              style: TextStyle(fontSize: 20),
            ),
          ]
        )
      ),
    );
  }
}
