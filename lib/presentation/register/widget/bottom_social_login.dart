import 'package:flutter/material.dart';
import '../../../app_core/color_constants.dart';
import '../../common/text_poppins.dart';

class BottomSocialLogin extends StatelessWidget {
  const BottomSocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              customDivider(),
              TextPoppins("or continue with", size: 8, color: ColorConstants.accent,),
              customDivider(),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                customBtn("Continue with Google", "assets/google_logo.png"),
                customBtn("Continue with Facebook", "assets/facebook_logo.png"),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget customDivider(){
    return Container(color: Colors.black26, width: 170, height: 1,);
  }

  Widget customBtn(String text, String iconPath){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: OutlinedButton(

          onPressed: null,

          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: Image.asset(iconPath, scale: 2.5,),
              ),

              TextPoppins(
                text,
                size: 13,
                weight: FontWeight.w400,
                color: ColorConstants.accent,
              ),
            ],
          )
      ),
    );
  }
}
