import 'package:basic_banking_app/screens/addCardDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'homeScreen.dart';

class ScreenOnBoarding extends StatelessWidget {
  final SharedPreferences prefs;
  final String boolKey;
  ScreenOnBoarding({this.prefs, this.boolKey});

  @override
  Widget build(BuildContext context) {
    prefs.setBool(boolKey, false); // You might want to save this on a callback.

    AssetImage assetImage = AssetImage("assets/screen_onboardimg.png");
    Image image = Image(image: assetImage);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: image,
              ),
              RichText(
                text: TextSpan(
                    text: "Money ",
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Moora",
                          style: TextStyle(
                            color: Colors.pink[300],
                          )),
                    ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
                child: Text(
                  "A brand new experiance of managing your business",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[900],
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardDetails()));
                  },
                  child: Text(
                    "Get Started Now",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
