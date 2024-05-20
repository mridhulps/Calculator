import 'package:calculator/Domain/models/calculatorModel.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils.dart';

final calculatorProvider =
    StateNotifierProvider<Statenotifier, Calculator>((ref) => Statenotifier());

//STATE NOTIFIER

class Statenotifier extends StateNotifier<Calculator> {
  Statenotifier() : super(Calculator(equations: '0', results: '0'));

  //ADD DIGITS METHODE;
  addEquation(String digits) {
    final addvalue = state.equations + digits;

    final currentstate = state.equations == '0' ? digits : addvalue;

    if (Utils.isOperatorAtEnd(state.equations)) {
      final isoperator = state.equations
          .replaceRange(state.equations.length - 1, null, digits);

      state = state.copy(equation: isoperator);
    } else {
      state = state.copy(equation: currentstate);
    }
  }

  //DELETE
  delete() {
    final delete = state.equations.substring(0, state.equations.length - 1);

    final equation = state.equations;

    if (equation.length == 1) {
      state = state.copy(equation: '0');
    } else {
      state = state.copy(equation: delete);
    }
  }

  //CLEAR ALL
  clearAll(String digits) {
    digits == 'AC' ? state = state.copy(equation: '0') : null;
  }

  void result() {}
}
