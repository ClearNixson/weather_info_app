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

  List<Map<String, String>> _forecast = [];
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
  void _fetch7DayForecast(){
    String city = _cityController.text;
    Random random = Random();
    for(int i = 0;i < 7;i++){
      int temperature = 15 + random.nextInt(16);
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      String condition = conditions[random.nextInt(conditions.length)];
      _forecast.add({
        'day' : 'Day ${i + 1}',
        'temperature' : '$temperature°C',
        'condition' : condition,
      });
    }
    setState(() {
      _cityName = city;
      _forecast = _forecast;
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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: Text('Fetch 7-Day Forecase')
            ),
            SizedBox(height: 20),
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Weather Condition: $_weatherCondition',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _forecast.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(_forecast[index]['day']!),
                      subtitle: Text('${_forecast[index]['temperature']}, ${_forecast[index]['condition']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
