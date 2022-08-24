import 'package:flutter/material.dart';
import '../../../app_core/color_constants.dart';
import '../../../data/controller/register/register_controller.dart';
import '../../common/text_poppins.dart';
import '../widget/bottom_social_login.dart';
import '../widget/login_user_input.dart';
import '../widget/button_accent.dart';

class LoginView extends StatelessWidget {
  TabController tabController;

  LoginView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        LoginUserInput(label: "Email", isPassword: false, textController: RegisterController.email,),

        LoginUserInput(label: "Password", isPassword: true, textController: RegisterController.password,),


        Row(
            children: [

              const Spacer(),

              TextButton(
                onPressed: null,
                child: TextPoppins("Forget Password?", size: 11, color: ColorConstants.accent,),
              )
            ]
        ),


        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: 80,
          width: 470,

          child: Expanded(
              child: ButtonAccent("Login", onPressed: () => RegisterController.signIn(context),)
          ),
        ),


        Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextPoppins("Don't have an account?", size: 10, color: ColorConstants.primaryLight,),
              TextButton(
                onPressed: ()=> goToSignup(),
                child: TextPoppins("Sign Up", size: 10, color: ColorConstants.accent,),
              )
            ]
        ),


        const BottomSocialLogin(),

      ],

    );
  }

  void goToSignup(){
    tabController.animateTo(0);
  }
}
