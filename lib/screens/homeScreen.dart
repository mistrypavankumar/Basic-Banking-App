import 'package:basic_banking_app/components/card/atmCard.dart';
import 'package:basic_banking_app/components/operationCard/operationCard.dart';
import 'package:basic_banking_app/components/transactionHistory/transactionHistory.dart';
import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/constants/data/cardData.dart';
import 'package:basic_banking_app/database/databaseHelper.dart';
import 'package:basic_banking_app/model/transectionDetails.dart';
import 'package:basic_banking_app/model/userData.dart';
import 'package:basic_banking_app/screens/transferMoney.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper _dbhelper = new DatabaseHelper();
  String userName = "M.Pavan Kumar";
  String avatar = "M";
  DateTime currentTime = DateTime.now();
  List<String> greetingList = [
    "Good Morning",
    "Good AfterNoon",
    "Good Evening",
    "Good Night"
  ];
  String greeting;

  List<CardData> _list;

  int current = 0;
  List datas = ["Money Transfer", "Bank Withdraw", "Insights Tracking"];

  void getGreeting() {
    if (currentTime.hour < 12) {
      greeting = greetingList[0];
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      greeting = greetingList[1];
    } else if (currentTime.hour >= 18 && currentTime.hour < 20) {
      greeting = greetingList[2];
    } else if (currentTime.hour >= 20 && currentTime.hour < 24) {
      greeting = greetingList[3];
    }
  }

  // Handling indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  void initState() {
    _list = CardData.cardDataList;

    getGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserData _userData = UserData(
      id: 0,
      userName: "M.Pavan Kumar",
      cardNumber: "**** **** **** 7143",
      cardExpiry: "05/25",
      totalAmount: 8000.0,
    );
    UserData _userData1 = UserData(
      id: 1,
      userName: "Ch.Meghana",
      cardNumber: "**** **** **** 7142",
      cardExpiry: "02/25",
      totalAmount: 19000.0,
    );
    UserData _userData2 = UserData(
      id: 2,
      userName: "M.Rakesh Kumar",
      cardNumber: "**** **** **** 3713",
      cardExpiry: "05/25",
      totalAmount: 10000.0,
    );
    UserData _userData3 = UserData(
      id: 3,
      userName: "D.Sai Kamal",
      cardNumber: "1**** **** **** 9423",
      cardExpiry: "01/25",
      totalAmount: 12000.0,
    );
    UserData _userData4 = UserData(
      id: 4,
      userName: "D.Sai Teja",
      cardNumber: "**** **** **** 7463",
      cardExpiry: "07/25",
      totalAmount: 18000.0,
    );
    UserData _userData5 = UserData(
      id: 5,
      userName: "B.Manoj Reddy",
      cardNumber: "**** **** **** 1463",
      cardExpiry: "08/25",
      totalAmount: 17000.0,
    );
    UserData _userData6 = UserData(
      id: 6,
      userName: "B.Rithvik",
      cardNumber: "**** **** **** 1163",
      cardExpiry: "09/25",
      totalAmount: 20000.0,
    );
    UserData _userData7 = UserData(
      id: 7,
      userName: "M.Vamshi",
      cardNumber: "**** **** **** 7883",
      cardExpiry: "08/25",
      totalAmount: 58000.0,
    );
    UserData _userData8 = UserData(
      id: 8,
      userName: "Srinivas",
      cardNumber: "**** **** **** 9963",
      cardExpiry: "04/25",
      totalAmount: 33000.0,
    );
    UserData _userData9 = UserData(
      id: 9,
      userName: "Vinay",
      cardNumber: "**** **** **** 7463",
      cardExpiry: "05/25",
      totalAmount: 68000.0,
    );

    TransectionDetails _transectionDetails = TransectionDetails(
      id: 0,
      transectionId: 0,
      userName: "M.Pavan Kumar",
      transectionAmount: 1000,

      // transectionDone: true,
    );

    _dbhelper.insertUserDetails(_userData);
    _dbhelper.insertUserDetails(_userData1);
    _dbhelper.insertUserDetails(_userData2);
    _dbhelper.insertUserDetails(_userData3);
    _dbhelper.insertUserDetails(_userData4);
    _dbhelper.insertUserDetails(_userData5);
    _dbhelper.insertUserDetails(_userData6);
    _dbhelper.insertUserDetails(_userData7);
    _dbhelper.insertUserDetails(_userData8);
    _dbhelper.insertUserDetails(_userData9);

    _dbhelper.insertTransectionHistroy(_transectionDetails);
    _dbhelper.updateTotalAmount(1, 20000);

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
              child: Text(avatar),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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

            //<<<<<<<<<<< ATM Card Section >>>>>>>>>>>>>>//
            Container(
              height: 199,
              child: FutureBuilder(
                initialData: [],
                future: _dbhelper.getUserDetails(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: mgDefaultPadding, right: 6),
                    itemCount: snapshot.data.length - 1,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() => {
                                userName = snapshot.data[index].userName,
                                avatar = snapshot.data[index].userName[0],
                              });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => TransferMoney(
                                currentBalance:
                                    snapshot.data[index].totalAmount,
                                currentCustomerId: snapshot.data[index].id,
                                currentUserCardNumebr:
                                    snapshot.data[index].cardNumber,
                              ),
                            ),
                          );
                        },
                        child: UserATMCard(
                          cardNumber: snapshot.data[index].cardNumber,
                          cardExpiryDate: snapshot.data[index].cardExpiry,
                          totalAmount: snapshot.data[index].totalAmount,
                          gradientColor: _list[index].mgPrimaryGradient,
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            //<<<<<<<<<<<< Operation section >>>>>>>>>>>>>//
            Padding(
              padding: const EdgeInsets.only(
                  left: mgDefaultPadding,
                  bottom: 13,
                  top: 29,
                  right: mgDefaultPadding),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Operation",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: map<Widget>(datas, (index, selected) {
                        return Container(
                          margin: const EdgeInsets.only(right: 3),
                          height: 9,
                          width: 9,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == index
                                ? mgBlueColor
                                : Colors.grey[400],
                          ),
                        );
                      }),
                    ),
                  ]),
            ),
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                padding: const EdgeInsets.only(left: mgDefaultPadding),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                        if (current == 0) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => TransferMoney()));
                        }
                      });
                    },
                    child: OperationCard(
                      operation: datas[index],
                      operationIcon: operationIcon[index],
                      isSelected: current == index,
                    ),
                  );
                },
              ),
            ),

            // <<<<<<<<< Transaction Section >>>>>>>>>>>> //
            Padding(
              padding: const EdgeInsets.only(
                  left: mgDefaultPadding,
                  bottom: 13,
                  top: 29,
                  right: mgDefaultPadding),
              child: Text(
                "Transaction Histories",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            Container(
              child: FutureBuilder(
                initialData: [],
                future: _dbhelper.getTransectionDetatils(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: mgDefaultPadding),
                    itemBuilder: (context, index) {
                      return TransactionHistroy(
                        isTransfer: false,
                        customerName:
                            snapshot.data[index].transectionId.toString(),
                        transferAmount: snapshot.data[index].transectionAmount,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
