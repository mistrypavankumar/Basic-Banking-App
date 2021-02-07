import 'package:flutter/material.dart';

class TransactionHistroy extends StatefulWidget {
  final String customerName;
  final String transactionDate;
  final bool isTransfer;
  TransactionHistroy({this.customerName, this.transactionDate, this.isTransfer});
  @override
  _TransactionHistroyState createState() => _TransactionHistroyState();
}

class _TransactionHistroyState extends State<TransactionHistroy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.only(left: 24, top: 12, bottom: 17, right: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(),
                child: CircleAvatar(backgroundColor: Colors.blue),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.customerName}",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    "${widget.transactionDate}",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.isTransfer ? '- ₹80000' : '+ ₹80000',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: widget.isTransfer ? Colors.red : Colors.green,
                      fontWeight: FontWeight.w500
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
