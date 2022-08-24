import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../register/screen/register_screen.dart';
import '../../register/widget/button_accent.dart';
import '../provider/register_provider.dart';

class UserToolbar extends StatelessWidget {
  bool isSigned;

  UserToolbar({Key? key, required this.isSigned}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return RegisterProvider.isRegistered ? toolbar() : signUpButton();
          }
      );
  }
}

void goToSignUp(){
  RegisterScreenState.tabController.animateTo(0);
}

Widget signUpButton(){
  return ButtonAccent("Sign Up", textSize: 12, onPressed: goToSignUp,);
}

Widget toolbar(){
  return Row(
    children: [
      customIcon(Icons.shopping_cart_outlined,),
      customIcon(Icons.notifications_outlined,),
    ],
  );
}

Widget customIcon(IconData icon){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),

    child: Icon(icon, size: 17,),
  );
}
