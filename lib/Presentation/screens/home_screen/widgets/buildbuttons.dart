import 'package:calculator/Core/constants/colors.dart';
import 'package:calculator/Presentation/refactors/iconwidget.dart';
import 'package:calculator/Presentation/refactors/textwidget.dart';

import 'package:calculator/Presentation/screens/home_screen/widgets/numbertile.dart';
import 'package:calculator/providers/calculator_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildButtons extends StatelessWidget {
  final WidgetRef ref;
  BuildButtons({super.key, required this.ref});

  final List<String> digitList = [
    'AC',
    '%',
    '/',
    'x',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '<',
    '0',
    '.',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            final digits = digitList[index];

            return NumberTile(
              tilecolor: isoperator(digits) ? Colors.amber : Colors.white,
              child: digits == '<'
                  ? iconWidget(icon: Icons.backspace_outlined, color: iconColor)
                  : digits == '%'
                      ? iconWidget(icon: Icons.percent, color: iconColor)
                      : digits == '/'
                          ? iconWidget(
                              icon: FontAwesomeIcons.divide, color: iconColor)
                          : digits == '-'
                              ? iconWidget(
                                  icon: FontAwesomeIcons.minus,
                                  color: iconColor,
                                  size: 15)
                              : digits == '+'
                                  ? iconWidget(
                                      icon: FontAwesomeIcons.plus,
                                      color: iconColor,
                                      size: 15)
                                  : digits == '='
                                      ? iconWidget(
                                          icon: FontAwesomeIcons.equals,
                                          color: iconColor,
                                          size: 19)
                                      : CustomText(
                                          string: digits,
                                          color: numberColor,
                                          fontsize:
                                              isoperator(digits) ? 20 : 17,
                                          fontweight: digits == 'AC' ||
                                                  digits == 'x' ||
                                                  digits == '-' ||
                                                  digits == '+' ||
                                                  digits == '+'
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
              ontap: () => onClick(digits, ref),
            );
          },
          itemCount: 19,
        ),
      ),
    );
  }
}

bool isoperator(String digits) {
  final List<String> operators = [
    'AC',
    '%',
    '/',
    'x',
    '-',
    '+',
  ];

  return operators.contains(digits);
}

onClick(String digits, WidgetRef ref) {
  switch (digits) {
    case 'AC':
      ref.read(calculatorProvider.notifier).clearAll(digits);
      break;
    case '<':
      ref.read(calculatorProvider.notifier).delete();
    case '':
    //ref.read(calculatorProvider.notifier).isoperator(digits);
    default:
      ref.read(calculatorProvider.notifier).addEquation(digits);
  }
}
