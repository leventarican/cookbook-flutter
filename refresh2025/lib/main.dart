import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 47, 131, 92)),
      ),
      home: const MyHomePage(title: 'refresh 2025'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _allItems = [
    'Python 🐍',
    'Java ☕',
    'C 🛠️',
    'C++ ➕➕',
    'C# 🎷',
    'JavaScript 🌐',
    'SQL 💾',
    'PHP 🐘',
    'Go 🐹',
    'Rust 🦀',
    'Kotlin 💙',
    'Swift 🦅',
    'R 📊',
    'Ruby 💎',
    'Dart 🎯',
    'Scala 🐮',
    'Perl 🐪',
    'Haskell 📐',
    'MATLAB 🧮',
    'TypeScript 🟦',
    'Assembly ⚙️',
    'Objective-C 📱',
    'Visual Basic 🔵',
    'Visual Basic .NET ⚫',
    'Delphi/Object Pascal 🏛️',
    'Fortran 🔢',
    'Lua 🌙',
    'Ada 🏹',
    'Prolog 🤖',
    'Lisp 🦜',
    'Erlang 🐘',
    'Elixir ✨',
    'F# 🎶',
    'Groovy 🐴',
    'D 🗜️',
    'COBOL 🏢',
    'Julia 🟣',
    'SAS 🔍',
    'Scheme 🍃',
    'Solidity 🛡️',
    'Shell 🐚',
    'PowerShell 🔌',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_allItems);
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems.where((item) => item.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('<Programming Languages>'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _filteredItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text(_filteredItems[index])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
