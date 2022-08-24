import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/register/screen/signup_view.dart';
import '../../common/top_tabs_widget.dart';
import 'login_view.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  List tabs = ["Sign Up", "Login"];

  static late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();

    tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: DefaultTabController(
              length: tabs.length,
              child: Column(
                children: [
                  SizedBox(width: 500, child: Center(
                      child: TopTabsWidget(tabsList: tabs, isRegister: true, controller: tabController)
                  )),

                  Container(color: Colors.black12, width: 500, height: 1,),

                  registerView()
                ],
              ),

            ),
          ),
    );
  }

  Widget registerView(){
    return Expanded(
            child: Container(
              width: 500,
              padding: const EdgeInsets.symmetric(vertical: 25),

              child: TabBarView(
                controller: tabController,

                children: [

                  SingleChildScrollView(child: SignupView(tabController: tabController,)),

                  SingleChildScrollView(child: LoginView(tabController: tabController,)),

                ],
              ),
          ),
    );
  }

}
