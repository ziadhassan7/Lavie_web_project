import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_core/color_constants.dart';

class TextPoppins extends StatelessWidget {
  String data;
  double? size;
  FontWeight? weight;
  Color? color;

  TextPoppins(
  this.data,
  {
    Key? key,
    this.size,
    this.weight,
    this.color = ColorConstants.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,

      style: GoogleFonts.poppins(
        textStyle: TextStyle(fontSize: size, fontWeight: weight, color: color),
      ),
    );
  }
}
