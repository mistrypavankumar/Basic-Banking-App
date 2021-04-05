import 'package:basic_banking_app/screens/homeScreen.dart';
import 'package:basic_banking_app/screens/screen_onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.get('initScreen');

  await preferences.setInt('initScree', 1);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'onboard': (context) => ScreenOnBoarding()
      },
    );
  }
}
