import 'dart:developer';

import 'package:calculator/Domain/models/calculatorModel.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils.dart';

final calculatorProvider =
    StateNotifierProvider<Statenotifier, Calculator>((ref) => Statenotifier());

class Statenotifier extends StateNotifier<Calculator> {
  Statenotifier() : super(Calculator(equations: '0', results: '0'));

  addEquation(String digits) {
    final addvalue = state.equations + digits;

    final delete = state.equations.substring(0, state.equations.length - 1);

    final currentstate = state.equations == '0' ? digits : addvalue;

    // if (isoperator(digits) != true) {
    //   state = state.copy(equation: currentstate);
    // } else {
    //   if (state.isoperatorAppend != true) {
    //     state = state.copy(equation: currentstate);
    //     state.isoperatorAppend = true;
    //   } else {
    //     state = state.copy(equation: delete);
    //     state.isoperatorAppend = false;
    //   }
    // }

    if (Utils.isOperator(digits) && Utils.isOperatorAtEnd(state.equations)) {
      state = state.copy(equation: delete);
      log('issign is true');
    } else {
      log('issign is not true');
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
}

bool operator(String digits) {
  final List<String> operators = [
    '%',
    '/',
    'x',
    '-',
    '+',
  ];

  final istrue = operators.contains(digits);

  return istrue;
}
