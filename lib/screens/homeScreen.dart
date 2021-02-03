import 'package:basic_banking_app/components/card/atmCard.dart';
import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/constants/data/cardData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "M.Pavan Kumar";
  String greeting = "Good Night";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mgBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: mgDefaultPadding),
          child: Icon(
            Icons.menu,
            color: mgMenuColor,
            size: 35,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: mgDefaultPadding),
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: Text("MP"),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.grey,
                          fontSize: 18,
                        )),
                Text(userName,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: mgBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
              ],
            ),
          ),
          
          SizedBox(height: 20),
          Container(
            height: 199,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, right:6),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return UserATMCard(
                  cardNumber: cardData[index].cardNumber,
                  cardHolderName: cardData[index].cardHolderName,
                  cardExpiryDate: cardData[index].cardExpiryDate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
