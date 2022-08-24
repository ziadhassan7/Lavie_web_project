import 'package:flutter/material.dart';
import '../../../app_core/color_constants.dart';
import '../../common/text_poppins.dart';

class ButtonAccent extends StatelessWidget {

  String text;
  double textSize;
  Function()? onPressed;

  ButtonAccent(this.text, {Key? key, this.textSize = 13, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorConstants.accent)
      ),

      onPressed: onPressed,

      child: TextPoppins(
        text,
        size: textSize,
        weight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
