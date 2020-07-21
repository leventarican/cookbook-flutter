import 'dart:math';

import 'package:flutter/material.dart';

///
/// GridView.builder itemCount is optional if you leave then the index is infinite.
///
class GridviewModelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Gridview & Model'),
        ),
        body: GridView.builder(
            itemCount: Data.data.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, index) => Ui(
                  model: Data.data[index],
                )));
  }
}

class Model {
  final int id;
  final String description;
  final Color color;

  Model({this.id, this.description, this.color});

  Model.random(this.id, this.description)
      : color = Color.fromARGB((255 / 2).round(), Random().nextInt(255),
            Random().nextInt(255), Random().nextInt(255));
}

class Data {
  static List<Model> get data =>
      List.generate(300, (index) => Model.random(index, 'desc: $index'));
}

class Ui extends StatelessWidget {
  final Model model;

  const Ui({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('tabbed: ${model.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text('${model.description}'),
        color: model.color,
      ),
    );
  }
}
