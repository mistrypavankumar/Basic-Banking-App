import 'package:flutter/material.dart';

class ScreenOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/screen_onboardimg.png"),
            ),
          ],
        ),
      ),
    );
  }
}
