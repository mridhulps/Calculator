import 'package:calculator/Core/constants/colors.dart';
import 'package:calculator/Presentation/refactors/iconwidget.dart';
import 'package:calculator/Presentation/refactors/textwidget.dart';

import 'package:calculator/Presentation/screens/home_screen/widgets/numbertile.dart';
import 'package:calculator/providers/calculator_provider.dart';
import 'package:calculator/providers/utils.dart';

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
                tilecolor:
                    Utils.isOperator(digits) ? Colors.amber : Colors.white,
                child: digits == '<'
                    ? iconWidget(
                        icon: Icons.backspace_outlined, color: iconColor)
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
                                            fontsize: Utils.isOperator(digits)
                                                ? 20
                                                : 17,
                                            fontweight: Utils.isOperator(digits)
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                ontap: () => onClick(digits, ref));
          },
          itemCount: 19,
        ),
      ),
    );
  }
}

void onClick(String digits, WidgetRef ref) {
  final provider = ref.read(calculatorProvider.notifier);

  switch (digits) {
    case 'AC':
      provider.reset();

      break;
    case '<':
      provider.delete();
      break;
    case '=':
      provider.result(isEqualpressed: true);

    default:
      provider.addEquation(digits);
      break;
  }
}
