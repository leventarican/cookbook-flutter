import 'package:flutter/material.dart';

class ProgrammingLanguagesPage extends StatefulWidget {
  const ProgrammingLanguagesPage({super.key});
  @override
  State<ProgrammingLanguagesPage> createState() =>
      _ProgrammingLanguagesPageState();
}

class _ProgrammingLanguagesPageState extends State<ProgrammingLanguagesPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
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
      _filteredItems =
          _allItems
              .where((item) => item.toLowerCase().contains(query))
              .toList();
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
      appBar: AppBar(title: const Text('Programming Languages')),
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
                return Card(child: Center(child: Text(_filteredItems[index])));
              },
            ),
          ),
        ],
      ),
    );
  }
}
