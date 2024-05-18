// ignore_for_file: file_names

class Calculator {
  bool isoperatorAppend;
  String equations;
  String results;

  Calculator(
      {this.equations = '0',
      this.results = '0',
      this.isoperatorAppend = false});

//COPYWITH METHODE;
  Calculator copy({String? equation, String? result, bool? isoperatorAppend}) {
    return Calculator(
        equations: equation ?? equations,
        results: result ?? results,
        isoperatorAppend: isoperatorAppend ?? this.isoperatorAppend);
  }
}
