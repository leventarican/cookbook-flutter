import 'package:flutter/material.dart';

class GridviewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Gesture',
            textDirection: TextDirection.rtl,
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          children: List.generate(50, (index) {
            return GestureDetector(
              onTap: () {
                debugPrint('tabbed: $index');
              },
              child: Container(
                height: 40.0,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.amberAccent[100],
                ),
                child: Center(
                  child: Text('data $index'),
                ),
              ),
            );
          }),
        ));
  }
}
