import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/initial/provider/register_provider.dart';
import 'package:la_vie_web/presentation/initial/screen/initial_screen.dart';
import 'package:provider/provider.dart';
import 'app_core/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],

      child: MaterialApp(
        title: 'La Vie',

        theme: ThemeData(
          primarySwatch: Colors.blue,

          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorConstants.accent,
            selectionColor: Colors.greenAccent,
            selectionHandleColor: Colors.black,
          ),
        ),

        home: InitialScreen(),
      ),
    );
  }
}
