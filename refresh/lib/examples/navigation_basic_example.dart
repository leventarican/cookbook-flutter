import 'package:flutter/material.dart';

class NavigationBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('navigation example'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('about'),
                ),
                body: Center(
                  child: RaisedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
          child: Text('about page'),
        ),
      ),
    );
  }
}
