// import 'dart:developer';

// import 'package:calculator/Core/constants/colors.dart';
// import 'package:calculator/Presentation/refactors/iconwidget.dart';
// import 'package:calculator/Presentation/refactors/textwidget.dart';
// import 'package:calculator/Presentation/screens/home_screen/widgets/numbertile.dart';
// import 'package:calculator/providers/calculator_provider.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BuildNumbers extends StatelessWidget {
//   final WidgetRef? ref;
//   final String digits;

//   const BuildNumbers({super.key, required this.digits, this.ref});

//   @override
//   Widget build(BuildContext context) {
//     return NumberTile(
//       tilecolor: isoperator(digits) ? Colors.amber : Colors.white,
//       child: digits == '<'
//           ? iconWidget(icon: Icons.backspace_outlined, color: iconColor)
//           : digits == '%'
//               ? iconWidget(icon: Icons.percent, color: iconColor)
//               : digits == '/'
//                   ? iconWidget(icon: FontAwesomeIcons.divide, color: iconColor)
//                   : digits == '-'
//                       ? iconWidget(
//                           icon: FontAwesomeIcons.minus,
//                           color: iconColor,
//                           size: 15)
//                       : digits == '+'
//                           ? iconWidget(
//                               icon: FontAwesomeIcons.plus,
//                               color: iconColor,
//                               size: 15)
//                           : digits == '='
//                               ? iconWidget(
//                                   icon: FontAwesomeIcons.equals,
//                                   color: iconColor,
//                                   size: 19)
//                               : CustomText(
//                                   string: digits,
//                                   color: numberColor,
//                                   fontsize: isoperator(digits) ? 20 : 17,
//                                   fontweight: digits == 'AC' ||
//                                           digits == 'x' ||
//                                           digits == '-' ||
//                                           digits == '+' ||
//                                           digits == '+'
//                                       ? FontWeight.bold
//                                       : FontWeight.normal,
//                                 ),
//       ontap: () {
//         log(digits);

//         if (ref != null) [ref!.read(calculatorProvider.notifier).state++];
//       },
//     );
//   }
// }

