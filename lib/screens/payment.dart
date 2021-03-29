import 'package:basic_banking_app/constants/constants.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final String customerAvatar,
      customerName,
      customerAccountNumber,
      currentUserCardNumber;
  Payment({
    this.customerAvatar,
    this.customerName,
    this.customerAccountNumber,
    this.currentUserCardNumber,
  });
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
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
          Container(
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
                      // elevation: 6,
                      // color: mgBlueColor,
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: mgDefaultPadding / 1.5),
                      onPressed: () {},
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
        ],
      ),
    );
  }
}
