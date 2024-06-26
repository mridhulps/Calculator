import 'package:calculator/Core/constants/colors.dart';
import 'package:calculator/Core/constants/screen_ratio.dart';
import 'package:calculator/Presentation/refactors/textwidget.dart';
import 'package:calculator/Presentation/screens/home_screen/widgets/buildbuttons.dart';
import 'package:calculator/providers/calculator_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(calculatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          string: 'Calculator',
          texttype: TextType.titleLarge,
          fonttype: FontType.aboretofont,
          fontweight: FontWeight.bold,
        ),
        titleTextStyle: const TextStyle(color: textColor, fontSize: 20),
        //centerTitle: true,
        backgroundColor: appbarcolor,
      ),
      body: SafeArea(
          //ROOT
          child: SizedBox(
        child: Column(
          children: [
            Expanded(
                //1ST ROOT
                child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //EQUATION
                  Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          string: provider.equations,
                          paddingbottom: 25,
                          paddingleft: 10,
                          fontsize: 40,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  //RESULT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: CustomText(
                          string: provider.results,
                          paddingbottom: 30,
                          paddingright: 10,
                          fontsize: 40,
                          color: Colors.white60,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
            //2ND ROOT
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  width: screenratio(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(38, 38, 38, 1)),
                  child: BuildButtons(
                    ref: ref,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
