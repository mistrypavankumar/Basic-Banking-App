import 'package:basic_banking_app/components/customerList/customerList.dart';
import 'package:basic_banking_app/constants/constants.dart';
import 'package:basic_banking_app/constants/data/cardData.dart';
import 'package:flutter/material.dart';

class TransferMoney extends StatefulWidget {
  final double currentBalance;
  final int currentCustomerId;

  TransferMoney({this.currentBalance, this.currentCustomerId});
  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  double _currentBalance = 0;

  List<CardData> _list;

  String customeNames(index) {
    if (widget.currentCustomerId == index) {
      return null;
    }
    return _list[index].cardHolderName;
  }

  @override
  void initState() {
    _list = CardData.cardDataList;
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
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
                  itemCount: _list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context, 
                          builder: (ctx) => _buildbottomSheet(ctx)
                        ),
                        child: CustomerList(
                        customerName: customeNames(index),
                        transactionDate: "",
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// ₹


Container _buildbottomSheet(BuildContext context) {
  return Container(
    height: 600,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    
  );
}