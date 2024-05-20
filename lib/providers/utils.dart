class Utils {
  //OPERATOR ISTRUE OR FALSE;
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

  //OPERATOR FIND AT END IS TRUE OR FALSE;

  static bool isOperatorAtEnd(String equation) {
    bool issign = false;

    for (var i in equation.substring(equation.length - 1).split(' ')) {
      if (isOperator(i)) {
        issign = true;
      } else {
        issign = false;
      }
    }

    return issign;
  }
}
