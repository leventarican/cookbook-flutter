import 'package:refresh/repository/programming_language.dart';

class ProgrammingLanguages {
  List<ProgrammingLanguage> _list;

  ProgrammingLanguages() {
    _list.add(new ProgrammingLanguage("go"));
    _list.add(new ProgrammingLanguage("kotlin"));
    _list.add(new ProgrammingLanguage("dart"));
  }

  List<ProgrammingLanguage> get list => _list;

  ProgrammingLanguage get next {
    _list.shuffle();
    return _list[0];
  }
}