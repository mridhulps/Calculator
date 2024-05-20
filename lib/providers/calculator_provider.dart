import 'package:calculator/Domain/models/calculatorModel.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

import 'utils.dart';

final calculatorProvider =
    StateNotifierProvider<Statenotifier, Calculator>((ref) => Statenotifier());

//STATE NOTIFIER

class Statenotifier extends StateNotifier<Calculator> {
  Statenotifier() : super(Calculator(equations: '0', results: '0'));

  //ADD DIGITS METHODE;
  addEquation(String digits) {
    if (Utils.isOperator(digits) && state.equations == '0' && digits != '-') {
      null;
    } else if (Utils.isOperator(digits) &&
        Utils.isOperatorAtEnd(state.equations)) {
      final isoperator = state.equations
          .replaceRange(state.equations.length - 1, null, digits);

      state = state.copy(equation: isoperator);
    } else if (state.isequalpressed == true &&
        Utils.isOperator(digits) == false) {
      state = state.copy(equation: digits, result: '0', isequalpressed: false);
    } else {
      final addvalue = state.equations + digits;

      final currentstate = state.equations == '0' ? digits : addvalue;

      state = state.copy(equation: currentstate, isequalpressed: false);
      result();
    }
  }

  //DELETE
  delete() {
    final delete = state.equations.substring(0, state.equations.length - 1);

    final equation = state.equations;

    if (equation.length == 1) {
      reset();
    } else {
      state = state.copy(equation: delete);
      result();
    }
  }

//RESET
  reset() {
    state = state.copy(equation: '0', result: '0');
  }

  //RESULT

  void result({bool? isEqualpressed}) {
    try {
      final newequation = state.equations.replaceAll('x', '*');

      final parse = Parser().parse(newequation);

      final mathModel = ContextModel();

      final result = parse.evaluate(EvaluationType.REAL, mathModel).toString();

      final res = result.substring(0, result.length - 2);

      final ispress = isEqualpressed == true
          ? state.copy(equation: res, result: res, isequalpressed: true)
          : state.copy(result: res);

      state = ispress;
    } catch (e) {
      null;
    }
  }
}
