import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ActionButton extends StatelessWidget {
  bool _type;
  VoidCallback _callback;
  ActionButton(this._type, this._callback);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Material(
          color: _type == true ? Colors.lightGreen : Colors.lightBlue,
          child: new InkWell(
            onTap: () => _callback(),
            child: new Center(
              child: new Container(
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 7.0)
                ),
                padding: EdgeInsets.all(30.0),
                child: new Text(
                  _type == true ? "data 0" : "data 1",
                  style: TextStyle(color: Colors.white70, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
        ));
  }
}
