import 'package:car/styles.dart';
import 'package:flutter/material.dart';
import 'package:car/circular_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const iLabelStyle = TextStyle(
  fontSize: 22.0,
  color: Color(0xFF8D8D77),
);

enum Hybrid { battery, petrol }

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Hybrid selectedPowering;
  int temp = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Virtual Cockpit"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 10.0,
                    percent: 0.6,
                    header: Text("Fuel", style: iLabelStyle),
                    center: Image.asset(
                      'assets/gas-station-100.png',
                      scale: 2,
                      color: Colors.lightGreen.shade100,
                    ),
                    reverse: true,
                    backgroundColor: AppColor.twilightCloud,
                    progressColor: Colors.lightGreen,
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  child: Container(
                    child: IconInstrument(
                      icon: FontAwesomeIcons.batteryHalf,
                      label: 'battery',
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (selectedPowering == Hybrid.petrol) {
                        selectedPowering = Hybrid.battery;
                      } else {
                        selectedPowering = Hybrid.petrol;
                      }
                    });
                    debugPrint('hybrid: $selectedPowering');
                  },
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: temp.toDouble(),
                    min: 15.0,
                    max: 30.0,
                    onChanged: (double newValue) {
                      setState(() {
                        temp = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}

class IconInstrument extends StatelessWidget {
  IconInstrument({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70.0,
          color: Colors.lightGreen.shade300,
        ),
        Text(
          label,
          style: iLabelStyle,
        ),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
