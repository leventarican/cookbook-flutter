import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: PsKwApp(),
    );
  }
}

class PsKwApp extends StatefulWidget {
  @override
  PsKwState createState() => PsKwState();
}

class PsKwState extends State<PsKwApp> {
  double input;
  double output;
  bool psOrKw;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    psOrKw = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText:
            "Input a Value in ${psOrKw == false ? "PS" : "KW"}",
      ),
      textAlign: TextAlign.center,
    );

    AppBar appBar = AppBar(
      title: Text("Power: PS - KW calculator"),
    );

    Container unitSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Text("PS"),
          Radio<bool>(
              groupValue: psOrKw,
              value: false,
              onChanged: (v) {
                setState(() {
                  psOrKw = v;
                });
              }),
          Text("KW"),
          Radio<bool>(
              groupValue: psOrKw,
              value: true,
              onChanged: (v) {
                setState(() {
                  psOrKw = v;
                });
              }),
        ],
      ),
    );

    Container calcBtn = Container(
      child: RaisedButton(
        child: Text("Calculate", style: TextStyle(fontSize: 25)),
        color: Colors.teal[700].withAlpha(100),
        onPressed: () {
          setState(() {
            psOrKw == false ? output = input / 1.36 : output = input * 1.36;
          });
          AlertDialog dialog = AlertDialog(
            content: psOrKw == false
                ? Text(
                    "${input.toStringAsFixed(2)} PS : ${output.toStringAsFixed(2)} KW")
                : Text(
                    "${input.toStringAsFixed(2)} KW : ${output.toStringAsFixed(2)} PS"),
          );
          showDialog(context: context, child: dialog);
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            inputField,
            unitSwitch,
            calcBtn,
          ],
        ),
      ),
    );
  }
}