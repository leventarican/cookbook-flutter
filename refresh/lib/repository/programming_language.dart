class ProgrammingLanguage {
  static List _data = const ["go", "kotlin", "dart", "cpp", "java", "python", "rust", "c"];
  String name;
  
  ProgrammingLanguage(this.name);

  static List get data {
    return _data;
  }
}