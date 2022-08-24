import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/initial/widget/user_toolbar.dart';
import '../../common/top_tabs_widget.dart';

class MainTopbar extends StatelessWidget {
  List tabs;
  TabController controller;

  MainTopbar({Key? key, required this.tabs, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 50),

      child: Row(
        children: [
          Image.asset("assets/lavie_logo.png", scale: 1.7,),

          const Spacer(),

          TopTabsWidget(tabsList: tabs, isRegister: false, controller: controller,),

          const Spacer(),

          UserToolbar(isSigned: false)
        ],
      ),
    );
  }
}
