import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/home/screen/home_screen.dart';
import 'package:provider/provider.dart';
import '../../register/screen/register_screen.dart';
import '../provider/register_provider.dart';
import '../widget/main_topbar.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}


class _InitialScreenState extends State<InitialScreen> with TickerProviderStateMixin{
  List tabs = ["Home", "Shop", "Blog", "About", "Community"];

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

        body: DefaultTabController(
              length: tabs.length,
              child: Column(
                children: [

                  MainTopbar(tabs: tabs, controller: tabController),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TabBarView(
                        children: [
                          getFirstScreen(),
                          RegisterScreen(),
                          RegisterScreen(),
                          RegisterScreen(),
                          RegisterScreen(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            )
    );
  }

  Widget getFirstScreen() {
    return
      Consumer<RegisterProvider>(
          builder: (context, provider, child) {
          return RegisterProvider.isRegistered ? const HomeScreen() : RegisterScreen();
        }
      );
  }
}
