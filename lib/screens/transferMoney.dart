import 'package:basic_banking_app/components/customerList/customerList.dart';
import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/database/databaseHelper.dart';
import 'package:basic_banking_app/screens/payment.dart';
import 'package:flutter/material.dart';

class TransferMoney extends StatefulWidget {
  final double currentBalance;
  final int currentCustomerId;
  final String currentUserCardNumebr;

  TransferMoney({
    this.currentBalance,
    this.currentCustomerId,
    this.currentUserCardNumebr,
  });
  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  double _currentBalance = 0.0;
  DatabaseHelper _dbHelper = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer Money"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: mgDefaultPadding),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Current Balance",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _currentBalance == widget.currentBalance
                          ? "₹ 0"
                          : "₹ ${widget.currentBalance}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w700,
                            color: _currentBalance == widget.currentBalance
                                ? Colors.red
                                : Colors.green,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: FutureBuilder(
                initialData: [],
                future: _dbHelper.getUserDetailsList(widget.currentCustomerId),
                builder: (context, snapshot) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: mgDefaultPadding),
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Payment(
                              customerAvatar: snapshot.data[index].userName[0],
                              customerName: snapshot.data[index].userName,
                              customerAccountNumber:
                                  snapshot.data[index].cardNumber,
                              currentUserCardNumber:
                                  widget.currentUserCardNumebr,
                              currentCustomerId: widget.currentCustomerId,
                              currentUserBalance: widget.currentBalance,
                              transferTouserId: snapshot.data[index].id,
                              tranferTouserCurrentBalance:
                                  snapshot.data[index].totalAmount,
                            ),
                          ),
                        ),
                        child: CustomerList(
                          customerName: snapshot.data[index].userName,
                          currentBalance: snapshot.data[index].totalAmount,
                          avatar: snapshot.data[index].userName[0],
                        ),
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

// ₹
