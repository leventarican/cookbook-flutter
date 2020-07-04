import 'package:flutter/material.dart';

/// CustomScrollView has an attribute slivers
class SliversExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SliverAppBar Title"),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 200,
                child: Container(
                    color: Colors.amber[50],
                    child: Center(
                        child: Container(
                      color: Colors.blueGrey[300],
                      child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                      ),
                    )))),
          ),
          SliverList(delegate: new SliverChildListDelegate(_buildList(10))),
        ],
      ),
    ));
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(
        Padding(
            padding: EdgeInsets.all(20.0),
            child:
                Text('Item ${i.toString()}', style: TextStyle(fontSize: 25.0))),
      );
    }

    return listItems;
  }
}
