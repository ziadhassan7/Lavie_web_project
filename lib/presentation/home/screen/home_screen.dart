import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/initial_controller/initial_controller.dart';
import 'package:la_vie_web/presentation/common/text_poppins.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: InitialController.getInitialData(),

        builder: (context, AsyncSnapshot snapshot) {

            return (snapshot.hasData) ?
              Center(child: TextPoppins(snapshot.data!, size: 40, weight: FontWeight.w600,),)

            : const Center(child: CircularProgressIndicator(),);

        }
    );
  }
}
