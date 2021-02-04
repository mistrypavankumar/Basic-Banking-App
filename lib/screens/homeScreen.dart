import 'package:basic_banking_app/components/card/atmCard.dart';
import 'package:basic_banking_app/components/operationCard/operationCard.dart';
import 'package:basic_banking_app/constants/constants.dart';
// import 'package:basic_banking_app/constants/data/cardData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "M.Pavan Kumar";
  String greeting = "Good Night";

  int current = 0;
  List datas = ["Money Transfer", "Bank Withdraw", "Insights Tracking"];

  // Handling indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

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
      body: SingleChildScrollView(
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: mgDefaultPadding, right: 6),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return UserATMCard(
                    cardNumber: "**** **** **** 7143",
                    cardHolderName: "M.Pavan Kumar",
                    cardExpiryDate: "07-02-2025",
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
                itemCount: 3,
                padding: const EdgeInsets.only(left: mgDefaultPadding),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
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
              child:Text(
                      "Transaction Histories",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
            ),
          
         Container(
           child:  ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
            itemBuilder: (context, index){
              return Container(
                  height: 70,
                  margin: const EdgeInsets.only(bottom:13),
                  padding: const EdgeInsets.only(left: 24, top: 12, bottom: 17, right:22 ),
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(8,8),
                        ),
                      ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                           
                        ),
                        child: CircleAvatar(backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
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
