import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  final Widget child;

  final double? fontsize;
  final FontWeight? fontweight;
  final Color? tilecolor;
  final Color? textcolor;
  final Alignment? textAlignment;
  final IconData? icon;
  final Function() ontap;

  const NumberTile({
    super.key,
    required this.child,
    required this.ontap,
    this.fontsize,
    this.fontweight,
    this.tilecolor,
    this.textcolor,
    this.icon,
    this.textAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
              backgroundColor: tilecolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Align(
            alignment: textAlignment!,
            child: child,
          )),
    );
  }
}
