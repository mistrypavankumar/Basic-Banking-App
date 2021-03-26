import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/database/databaseHelper.dart';
import 'package:basic_banking_app/model/userData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class AddCardInfo extends StatefulWidget {
  @override
  _AddCardInfoState createState() => _AddCardInfoState();
}

class _AddCardInfoState extends State<AddCardInfo> {
  int id = 0;
  String userName = "";
  String cardNumber = "";
  String cardExpiry = "";
  double currentAmount = 0.0;

  FocusNode _userNameFocus;
  FocusNode _cardNumberFocus;
  FocusNode _cardExpiryFocus;
  FocusNode _currentamountFocus;

  DatabaseHelper _dbHelper = new DatabaseHelper();

  @override
  void initState() {
    _userNameFocus = FocusNode();
    _cardNumberFocus = FocusNode();
    _cardExpiryFocus = FocusNode();
    _currentamountFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Added Card Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: mgBlueColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 22,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    focusNode: _userNameFocus,
                    controller: TextEditingController()..text = userName,
                    onChanged: (value) {
                      if (value != "") {
                        userName = value;
                      }
                      _cardExpiryFocus.requestFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Enter user name",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 22,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    focusNode: _cardNumberFocus,
                    onChanged: (value) {
                      if (value != "") {
                        cardNumber = value;
                      }
                      _cardExpiryFocus.requestFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Enter card number",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 22,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    focusNode: _currentamountFocus,
                    onChanged: (value) {
                      if (value != "") {
                        cardExpiry = value;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter card expiry",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 22,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      if (value != "") {
                        currentAmount = double.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter current amount",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Expanded(
                    child: RaisedButton(
                      color: mgBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () async {
                        final insertData = UserData(
                          id: id,
                          userName: userName,
                          cardNumber: cardNumber,
                          totalAmount: currentAmount,
                        );

                        await _dbHelper.insertUserDetails(insertData);
                        print(_dbHelper.getUserDetails());
                      },
                      child: Text(
                        "Add Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
