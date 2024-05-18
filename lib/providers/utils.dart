import 'dart:developer';

import 'package:calculator/Presentation/screens/home_screen/widgets/buildbuttons.dart';

class Utils {
  static bool isOperator(String digits) {
    final List<String> operators = [
      '%',
      '/',
      'x',
      '-',
      '+',
    ];

    final iscontaine = operators.contains(digits);

    return iscontaine;
  }

  static bool isOperatorAtEnd(String equation) {
    bool issign = false;

    print(equation.toString());

    // for (String i in equation.split(' ')) {
    //   if (isoperator(i)) {
    //     issign = true;
    //   } else {
    //     issign = false;
    //   }
    // }
    return issign;
  }
}
