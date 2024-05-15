import 'package:flutter/material.dart';

Widget iconWidget({
  required IconData icon,
  double? size,
  Color color = Colors.white,
  double? paddingleft,
  double? paddingright,
  Function()? ontap,
}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft ?? 0, right: paddingright ?? 0),
    child: InkWell(
      onTap: ontap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    ),
  );
}
