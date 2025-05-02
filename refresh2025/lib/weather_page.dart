import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<WeatherData> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherData();
  }

  Future<WeatherData> fetchWeatherData() async {
    // http://goweather.xyz/weather/istanbul ~> HTTP not working
    // https://goweather.herokuapp.com/weather/istanbul
    final response = await http.get(
      Uri.parse('https://goweather.herokuapp.com/weather/berlin'),
    );

    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw Exception('Empty response from API');
      }
      final jsonData = jsonDecode(response.body);
      return WeatherData.fromJson(jsonData);
    } else if (response.statusCode == 404) {
      throw Exception('Weather for city not found');
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Forecast')),
      body: FutureBuilder<WeatherData>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return WeatherDisplay(weatherData: snapshot.data!);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDisplay({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Weather',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text('Temperature: ${weatherData.temperature}'),
          Text('Wind: ${weatherData.wind}'),
          Text('Description: ${weatherData.description}'),
          const SizedBox(height: 24),
          Text('Forecast', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: weatherData.forecast.length,
              itemBuilder: (context, index) {
                final forecast = weatherData.forecast[index];
                return ListTile(
                  title: Text('Day: ${forecast.day}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature: ${forecast.temperature}'),
                      Text('Wind: ${forecast.wind}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherData {
  final String temperature;
  final String wind;
  final String description;
  final List<Forecast> forecast;

  WeatherData({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('temperature') ||
        !json.containsKey('wind') ||
        !json.containsKey('description') ||
        !json.containsKey('forecast')) {
      throw Exception('Invalid Weather Data from the API');
    }

    var list = json['forecast'] as List;
    List<Forecast> forecastList =
        list.map((i) => Forecast.fromJson(i)).toList();

    return WeatherData(
      temperature: json['temperature'],
      wind: json['wind'],
      description: json['description'],
      forecast: forecastList,
    );
  }
}

class Forecast {
  final String day;
  final String temperature;
  final String wind;

  Forecast({required this.day, required this.temperature, required this.wind});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      day: json['day'],
      temperature: json['temperature'],
      wind: json['wind'],
    );
  }
}
