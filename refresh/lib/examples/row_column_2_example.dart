import 'package:flutter/material.dart';

class RowColumn2Example extends StatefulWidget {
  @override
  _RowColumn2ExampleState createState() => _RowColumn2ExampleState();
}

class _RowColumn2ExampleState extends State<RowColumn2Example> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'foobar',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('foobar'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              debugPrint('orientation: ${MediaQuery.of(context).orientation}');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          flexibleSpace: SafeArea(
            child: Icon(
              Icons.photo_camera,
              size: 75.0,
              color: Colors.white70,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color: Colors.lightGreen.shade100,
              height: 75.0,
              width: double.infinity,
              child: Center(
                child: Text('appbar'),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const RowWidget(),
                  Divider(),
                  const ColumnWidget(),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Text('Row 1'),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Text('Row 2'),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Text('Row 3'),
          ],
        ),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
}
