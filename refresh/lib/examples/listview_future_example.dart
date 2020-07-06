import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Lang {
  int id;
  String name;

  Lang({this.id, this.name});
}

Future<List<Lang>> _data(int limit) {
  var random = Random();
  return Future.delayed(Duration(seconds: random.nextInt(5)), () {
    return List.generate(limit, (index) {
      var ms = DateTime.now().millisecond;
      return Lang(id: ms, name: 'Lang: $ms');
    });
  });
}

const total = 10;
var completers = new List<Completer<Lang>>();

Widget _ui(int index, int limit) {
  debugPrint('index: $index; completer length: ${completers.length}');
  if (index >= completers.length) {
    debugPrint('generate completer list and wait for data.');
    completers.addAll(List.generate(limit, (index) => Completer()));

    _data(limit).then((items) {
      items.asMap().forEach((key, lang) {
        debugPrint('k: $key; v: $lang');
        completers[index + key].complete(lang);
      });
    });
  }

  var future = completers[index].future;

  return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('waiting');
          case ConnectionState.done:
            var lang = snapshot.data as Lang;
            return Text('done: ${lang.id} - ${lang.name}');
          default:
            return Text('default');
        }
      });
}

class ListViewFutureExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('future'),
      ),
      body: ListView.builder(
          itemCount: total,
          itemBuilder: (BuildContext context, int index) => _ui(index, 3)),
    );
  }
}
