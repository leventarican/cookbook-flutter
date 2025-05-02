import 'package:flutter/material.dart';

import 'weather_page.dart';
import 'programminglang_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'firebase-studio-development',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 47, 131, 92),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  100,
                ), // Double the size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProgrammingLanguagesPage(),
                  ),
                );
              },
              child: const Text(
                'Programming Languages',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20), // Add more space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  100,
                ), // Double the size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherPage()),
                );
              },
              child: const Text(
                'Weather',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
