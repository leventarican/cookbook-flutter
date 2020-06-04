import 'package:car/styles.dart';
import 'package:flutter/material.dart';
import 'package:car/circular_percent_indicator.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Virtual Cockpit"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 300.0,
                  lineWidth: 20.0,
                  percent: 0.6,
                  header: Text("Fuel", style: TextStyle(fontSize: 50.0)),
                  center: Image.asset('assets/gas-station-100.png', scale: 1,),
                  reverse: true,
                  backgroundColor: AppColor.twilightCloud,
                  progressColor: Colors.lightGreen,
                ),
              ],
            ),
          ),
        ));
  }
}
