

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String string;
  final double? paddingright;
  final double? paddingleft;
  final double? paddingtop;
  final double? paddingbottom;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  final TextOverflow? overflow;
  final TextType texttype;
  //import googlefonts package;
  final FontType? fonttype;

  const CustomText({
    super.key,
    required this.string,
    this.paddingright,
    this.paddingleft,
    this.paddingtop,
    this.paddingbottom,
    this.color,
    this.fontsize,
    this.fontweight,
    this.overflow,
    this.fonttype = FontType.roboto,
    this.texttype = TextType.deFault,
  });

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;

    return Padding(
        padding: EdgeInsets.only(
            left: paddingleft ?? 0.0,
            right: paddingright ?? 0.0,
            top: paddingtop ?? 0.0,
            bottom: paddingbottom ?? 0.0),
        child: SizedBox(
          child: Text(string,
              style: (texttype == TextType.deFault)
                  ? TextStyle(
                      color: color ?? Colors.white,
                      fontSize: fontsize,
                      fontWeight: fontweight,
                      overflow: overflow,
                      fontFamily: fonttype == FontType.aboretofont
                          ? GoogleFonts.aboreto().fontFamily
                          : GoogleFonts.roboto().fontFamily)
                  : (texttype == TextType.titleLarge)
                      ? buildCopywith(text.bodyLarge)
                      : (texttype == TextType.titleMedium)
                          ? buildCopywith(text.bodyMedium)
                          : (texttype == TextType.titleSmall)
                              ? buildCopywith(text.bodySmall)
                              : (texttype == TextType.subtitleLarge)
                                  ? buildCopywith(text.labelLarge)
                                  : (texttype == TextType.subtitleMedium)
                                      ? buildCopywith(text.labelMedium)
                                      : buildCopywith(text.labelSmall)),
        ));
  }

  TextStyle buildCopywith(TextStyle? style) {
    if (style == null) {
      null;
    }

    return style!.copyWith(
        color: color ?? Colors.white,
        fontSize: fontsize,
        fontWeight: fontweight,
        overflow: overflow,
        fontFamily: fonttype == FontType.aboretofont
            ? GoogleFonts.aboreto().fontFamily
            : GoogleFonts.roboto().fontFamily);
  }
}

enum TextType {
  deFault,
  titleLarge,
  titleMedium,
  titleSmall,
  subtitleLarge,
  subtitleMedium,
  subtitleSmall
}

enum FontType { roboto, aboretofont }