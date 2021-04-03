import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/database/databaseHelper.dart';
import 'package:basic_banking_app/model/transectionDetails.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final String customerAvatar,
      senderName,
      customerName,
      customerAccountNumber,
      currentUserCardNumber;
  final int transferTouserId, currentCustomerId;
  final double currentUserBalance, tranferTouserCurrentBalance;
  Payment({
    this.customerAvatar,
    this.customerName,
    this.senderName,
    this.customerAccountNumber,
    this.currentUserCardNumber,
    this.currentCustomerId,
    this.transferTouserId,
    this.currentUserBalance,
    this.tranferTouserCurrentBalance,
  });
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double transferAmount;

  DatabaseHelper _dbHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mgBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(widget.customerAvatar),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.customerName,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Text(widget.customerAccountNumber,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600])),
              ],
            ),
          ),
          SizedBox(height: 100),
          Column(
            children: [
              Form(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
                child: TextFormField(
                  onChanged: (value) {
                    transferAmount = double.parse(value);
                  },
                  validator: (check) => "please enter amount",
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    prefixText: "₹ ",
                    hintStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              )),
            ],
          ),
          Spacer(),
          Flexible(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: mgDefaultPadding * 1.5,
                    vertical: mgDefaultPadding * 5 / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Card No: ${widget.currentUserCardNumber}",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w600,
                            )),
                    SizedBox(height: 5),
                    Text(
                      "Check Balance",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: mgBlueColor,
                          ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (transferAmount == 0 ||
                              transferAmount > widget.currentUserBalance) {
                            print("Balance is insufficent");
                          } else {
                            double currentUserRemainingBalance =
                                widget.currentUserBalance - transferAmount;

                            _dbHelper.updateTotalAmount(
                                widget.currentCustomerId,
                                currentUserRemainingBalance);

                            double transferToCurrentBalance =
                                widget.tranferTouserCurrentBalance +
                                    transferAmount;

                            _dbHelper.updateTotalAmount(widget.transferTouserId,
                                transferToCurrentBalance);

                            TransectionDetails _transectionDetails =
                                TransectionDetails(
                              transectionId: widget.currentCustomerId,
                              userName: widget.customerName,
                              senderName: widget.senderName,
                              transectionAmount: transferAmount,
                            );

                            _dbHelper
                                .insertTransectionHistroy(_transectionDetails);
                          }
                        },
                        child: Text(
                          "Pay",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
