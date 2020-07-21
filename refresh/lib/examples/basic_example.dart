import 'dart:async';

import 'package:flutter/material.dart';

///
/// the flutter basics
/// 1. create a stateless widget
/// 2. create a stateful widget: https://github.com/FilledStacks/flutter-tutorials/blob/master/004-flutter-basics/02-setState/lib/home.dart
/// 
/// async patterns
/// 3. build view with FutureBuilder: https://github.com/FilledStacks/flutter-tutorials/blob/master/004-flutter-basics/03-futureBuilder/lib/home.dart
/// 4. StreamBuilder: https://github.com/FilledStacks/flutter-tutorials/blob/master/004-flutter-basics/04-streamBuilder/lib/home.dart
/// 5. Model: https://github.com/FilledStacks/flutter-tutorials/blob/master/004-flutter-basics/05-view-model/lib/home_model.dart
///
class BasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeStateless());
        // home: HomeStateful());
        // home: HomeFuture());
        // home: HomeStream());
        home: HomeModel());
  }
}

/// 1. stateless
/// ############################################################################
class HomeStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

/// 2. stateful
/// ############################################################################
/// show a list of data in a list view
/// imagine that the data is queried from a database. this will have a bit delay.
///
class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
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
  /// at begin data is null. to indicate that the progress indicator.
  ///
  /// state will be chanced when delay of 2s is passed.
  /// then the widget is redrawn.
  /// data items are then ready and list view can be filled.
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
}

/// 3. FutureBuilder
/// ############################################################################
/// on button press get data
/// build list view with FutureBuilder

class HomeFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: FutureBuilder(
        future: _getListData(hasData: false),
        builder: (buildercontext, snapshot) {
          // data can have an error
          if (snapshot.hasError) {
            return _getMessageUi('data error.');
          }

          // data delay
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data;

          // data can be empty
          if (data.length == 0) {
            return _getMessageUi('no data.');
          }

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (buildContext, index) =>
                  _getListItemUi(index, data));
        },
      ),
    );
  }
}

///
/// return a list of string elements after 2s delay.
/// thus this function is a asynchronous function.
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

  debugPrint('generating data');
  return List.generate(10, (index) => 'data: $index');
}

/// 4. StreamBuilder
/// we use a stream controller to manage the data states.
/// ############################################################################
///

enum HomeViewState { Busy, DataRetrieved, NoData }

class HomeStream extends StatefulWidget {
  @override
  _HomeStreamState createState() => _HomeStreamState();
}

class _HomeStreamState extends State<HomeStream> {
  List<String> data;
  final controller = StreamController<HomeViewState>();

  @override
  void initState() {
    _getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
            stream: controller.stream,
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return _getMessageUi(snapshot.error);
              }

              if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data == HomeViewState.NoData) {
                return _getMessageUi('no data.');
              }

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (buildContext, index) =>
                      _getListItemUi(index, data));
            }));
  }

  Future _getListData({bool hasError = false, bool hasData = true}) async {
    controller.add(HomeViewState.Busy);
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return controller.addError('data error.');
    }

    if (!hasData) {
      return controller.add(HomeViewState.NoData);
    }

    data = List<String>.generate(10, (index) => 'data: $index');
    controller.add(HomeViewState.DataRetrieved);
  }
}

/// Model ans Stream
/// ############################################################################
///

class HomeModel extends StatefulWidget {
  @override
  _HomeModelState createState() => _HomeModelState();
}

class _HomeModelState extends State<HomeModel> {
  final model = Model();

  @override
  void initState() {
    model.getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
            stream: model.homeState,
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return _getMessageUi(snapshot.error);
              }

              if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data == HomeViewState.NoData) {
                return _getMessageUi('no data.');
              }

              return ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (buildContext, index) =>
                      _getListItemUi(index, model.data));
            }));
  }
}

class Model {
  List<String> data;
  final _controller = StreamController<HomeViewState>();
  Stream<HomeViewState> get homeState => _controller.stream;

  Future getListData({bool hasError = false, bool hasData = true}) async {
    _controller.add(HomeViewState.Busy);
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return _controller.addError('data error.');
    }

    if (!hasData) {
      return _controller.add(HomeViewState.NoData);
    }

    data = List<String>.generate(10, (index) => '$index title');
    _controller.add(HomeViewState.DataRetrieved);
  }
}

/// general UI functions
/// ############################################################################

Widget _getMessageUi(String msg) {
  return Center(
      child: Text(
    msg,
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red[400]),
  ));
}

Widget _getListItemUi(int index, List<String> listItems) {
  return Container(
    margin: EdgeInsets.all(5.0),
    height: 50.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
    child: Center(
      child: Text(
        listItems[index],
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
