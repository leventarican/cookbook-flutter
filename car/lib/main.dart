import 'package:car/page.dart';
import 'package:car/styles.dart';
import 'package:flutter/material.dart';

void main() => runApp(CarApp());

class CarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
    );

    return MaterialApp(
        title: "Virtual Cockpit",
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: AppPage());
  }
}
