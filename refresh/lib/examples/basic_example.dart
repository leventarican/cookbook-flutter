import 'package:flutter/material.dart';

///
/// the flutter basics
/// 1. create a stateless widget
/// 2. create a stateful widget: https://github.com/FilledStacks/flutter-tutorials/blob/master/004-flutter-basics/02-setState/lib/home.dart
///
class BasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Home());
        home: HomeWith());
  }
}

// 1. stateless
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

///
/// 2. stateful
/// show a list of data in a list view
/// imagine that the data is queried from a database. this will have a bit delay.
///
class HomeWith extends StatefulWidget {
  @override
  _HomeWithState createState() => _HomeWithState();
}

class _HomeWithState extends State<HomeWith> {
  List<String> _data;
  bool get _isFetchingData => _data == null;

  @override
  void initState() {
    // on init we start with an error
    _getListData(hasError: true)
        .then((data) => setState(() {
              if (data.length == 0) {
                data.add('no data.');
              }
              _data = data;
            }))
        .catchError((error) => setState(() {
              _data = [error];
            }));

    super.initState();
  }

  ///
  /// show progress indicator if data is not ready.
  /// otherwise show data.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: _isFetchingData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _data.length,
                itemBuilder: (buildContext, index) => _getListItemUi(index)));
  }

  _getListItemUi(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
        child: Text(
          _data[index],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  ///
  /// simulate a delay for 2s.
  /// because of waiting this function is a asynchronous function.
  /// it will return a list of string elements after 2s delay.
  ///
  Future<List<String>> _getListData(
      {bool hasError = false, bool hasData = true}) async {
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return Future.error('error occured while getting data.');
    }

    // return empty list if no data queried.
    if (!hasData) {
      return List<String>();
    }

    return List.generate(10, (index) => 'data: $index');
  }
}
