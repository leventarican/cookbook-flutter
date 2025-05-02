import 'dart:math';
import 'package:flutter/material.dart';

class FirstGradeMathPage extends StatefulWidget {
  const FirstGradeMathPage({super.key});

  @override
  State<FirstGradeMathPage> createState() => _FirstGradeMathPageState();
}

class _FirstGradeMathPageState extends State<FirstGradeMathPage> {
  late MathTask _currentTask;
  final TextEditingController _answerController = TextEditingController();
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    _currentTask = _generateTask();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  MathTask _generateTask() {
    final random = Random();
    final a = random.nextInt(10) + 1;
    final b = random.nextInt(10) + 1;
    final c = a + b;
    final taskType = random.nextInt(3); // 0, 1, or 2
    switch (taskType) {
      case 0:
        return MathTask(a: a, b: b, c: c, missing: Missing.c);
      case 1:
        return MathTask(a: a, b: b, c: c, missing: Missing.b);
      case 2:
        return MathTask(a: a, b: b, c: c, missing: Missing.a);
      default:
        return MathTask(a: a, b: b, c: c, missing: Missing.c);
    }
  }

  void _checkAnswer() {
    final userAnswer = int.tryParse(_answerController.text);
    if (userAnswer == null) {
      setState(() {
        _feedback = 'Please enter a number.';
      });
      return;
    }

    if (_currentTask.checkAnswer(userAnswer)) {
      setState(() {
        _feedback = 'Correct!';
        _currentTask = _generateTask();
        _answerController.clear();
      });
    } else {
      setState(() {
        _feedback = 'Incorrect. Try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Grade Math')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _currentTask.getTaskText(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _answerController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Answer',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkAnswer,
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Text(_feedback, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

enum Missing { a, b, c }

class MathTask {
  final int a;
  final int b;
  final int c;
  final Missing missing;

  MathTask({
    required this.a,
    required this.b,
    required this.c,
    required this.missing,
  });

  String getTaskText() {
    switch (missing) {
      case Missing.a:
        return '__ + $b = $c';
      case Missing.b:
        return '$a + __ = $c';
      case Missing.c:
        return '$a + $b = __';
      default:
        return '';
    }
  }

  bool checkAnswer(int answer) {
    switch (missing) {
      case Missing.a:
        return answer == a;
      case Missing.b:
        return answer == b;
      case Missing.c:
        return answer == c;
      default:
        return false;
    }
  }
}
