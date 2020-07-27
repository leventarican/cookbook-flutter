import 'package:flutter/material.dart';
import 'dart:math' as math;

///
/// demonstration of basic widgets
/// also demo of simple state. like in React.
/// the UI is re-build when the state changes with Stateful widgets.
///

///
/// the widget class: for drawing the widget
/// is public
///
class StateAndWidget extends StatefulWidget {
  final String lang;

  StateAndWidget({Key key, this.lang}) : super(key: key);

  @override
  _StateAndWidgetState createState() => _StateAndWidgetState();
}

///
/// the state class: for maintaining the data
/// is private
///
class _StateAndWidgetState extends State<StateAndWidget> {
  var _languages = [
    "go",
    "dart",
    "kotlin",
    "java",
    "c++",
    "python",
    "javascript",
    "c"
  ];

  var _lang;

  // whenever we change a state we do this in setState function
  _action() {
    setState(() {
      _languages..shuffle();
      _lang = _languages.first;
      debugPrint(_lang);
    });
  }

  @override
  void initState() {
    super.initState();

    // get initial value from StateAndWidget
    _lang = widget.lang;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widgets showroom',
            style: Theme.of(context).textTheme.headline5),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=41'),
                      backgroundColor: Colors.lime[200],
                      radius: 50.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(_lang, style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  RaisedButton(
                    child: Text(
                      "action",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    color: Colors.amber[200],
                    padding: EdgeInsets.all(16.0),
                    onPressed: _action,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text('Transform',
                      style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  Transform.rotate(
                    angle: 45.0 * math.pi / 180.0,
                    child: Transform.scale(
                      scale: 0.5,
                      child: Container(
                        color: Colors.lightGreen.shade100,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ),
                  Text('Stack', style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: Colors.lightGreen.shade100,
                            height: 40.0,
                            width: 40.0,
                          ),
                          Container(
                            color: Colors.lightGreen.shade200,
                            height: 30.0,
                            width: 30.0,
                          ),
                          Container(
                            color: Colors.lightGreen.shade300,
                            height: 20.0,
                            width: 20.0,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.lightGreen.shade100,
                        height: 400.0,
                        width: 40.0,
                      ),
                      Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.lightGreen.shade100,
                              Colors.lightGreen.shade500,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightGreen.shade300,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Decoration',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0))),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Card(
                          elevation: 32.0,
                          color: Colors.white,
                          margin: EdgeInsets.all(16.0),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Card',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0,
                                  )),
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0),
                                    bottom: Radius.circular(16.0)),
                                child: Image.network(
                                    'https://picsum.photos/250?image=71'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.timelapse),
                                title: Text('Foobar'),
                                subtitle: Text('developed by flutter'),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
