import 'package:flutter/material.dart';
import '../../../app_core/color_constants.dart';
import '../../../data/controller/register/register_controller.dart';
import '../../common/text_poppins.dart';
import '../widget/bottom_social_login.dart';
import '../widget/button_accent.dart';
import '../widget/login_user_input.dart';

class SignupView extends StatelessWidget {
  TabController tabController;

  SignupView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

        children: [
          Row(
            children: [
              Expanded(child: LoginUserInput(label: "First Name",
                isPassword: false,
                textController: RegisterController.firstName,)),

              Expanded(child: LoginUserInput(
                label: "Last Name",
                isPassword: false,
                textController: RegisterController.lastName,))
            ],
          ),

          LoginUserInput(label: "Email",
            isPassword: false,
            textController: RegisterController.email,),

          LoginUserInput(label: "Password",
            isPassword: true,
            textController: RegisterController.password,),

          LoginUserInput(label: "Re-enter Password",
            isPassword: true,
            textController: RegisterController.rePassword,),


          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            height: 80,
            width: 470,

            child: Expanded(
                child: ButtonAccent("Sign Up",
                    onPressed: () => RegisterController.signUp(context),)
            ),
          ),


          Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                TextPoppins("Already have an account?", size: 10,
                  color: ColorConstants.primaryLight,),
                TextButton(
                  onPressed: () => goToLogin(),
                  child: TextPoppins(
                    "Sign In", size: 10, color: ColorConstants.accent,),
                )
              ]
          ),


          const BottomSocialLogin(),
        ]

    );
  }

  void goToLogin() {
    tabController.animateTo(1);
  }
}
