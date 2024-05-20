// ignore_for_file: file_names

class Calculator {
  String equations;
  String results;
  bool isequalpressed;

  Calculator(
      {this.equations = '0', this.results = '0', this.isequalpressed = false});

//COPYWITH METHODE;
  Calculator copy({String? equation, String? result, bool? isequalpressed}) {
    return Calculator(
        equations: equation ?? equations,
        results: result ?? results,
        isequalpressed: isequalpressed ?? this.isequalpressed);
  }
}
