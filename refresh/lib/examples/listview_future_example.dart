import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:refresh/repository/programming_language.dart';

class Lang {
  int id;
  String name;

  Lang({this.id, this.name});
}

Future<List<Lang>> _data(int start, int end) {
  var random = Random();
  Future.delayed(Duration(seconds: random.nextInt(5)), () {
    return List.generate(end, (index) {
      return Lang(id: start + index, name: 'Lang: ${start + index}');
    });
  });
}

var totalLang = 10;
var completers = new List<Completer<Lang>>();

Widget _ui(int index) {
  if (index != completers.length) {
    completers.addAll(List.generate(totalLang, (index) => Completer()));

    _data(0, totalLang).then((items) {
      
    });
  }

  var future = completers[index].future;

  FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('waiting');
          case ConnectionState.done:
            return Text('done');
          default:
            return Text('default');
        }
      });
}
