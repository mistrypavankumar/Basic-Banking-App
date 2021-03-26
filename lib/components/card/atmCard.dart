import 'package:basic_banking_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserATMCard extends StatefulWidget {
  final String cardNumber, cardHolderName, cardExpiryDate;
  final gradientColor;

  UserATMCard({
    Key key,
    @required this.cardNumber,
    @required this.cardHolderName,
    @required this.cardExpiryDate,
    this.gradientColor,
  });

  @override
  _UserATMCardState createState() => _UserATMCardState();
}

class _UserATMCardState extends State<UserATMCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: mgDefaultPadding / 2),
      height: 199,
      width: 344,
      decoration: BoxDecoration(
          gradient: widget.gradientColor,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          )),
      child: Stack(
        children: [
          Positioned(
            left: 29,
            top: 30,
            child: Text(
              "CARD NUMBER",
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: .5,
                    fontSize: 12,
                  ),
            ),
          ),
          Positioned(
            left: 29,
            top: 49,
            child: Text(
              widget.cardNumber,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
            ),
          ),
          Positioned(
            right: 21,
            top: 35,
            child: SvgPicture.asset(
              cardsIcon[0],
              width: 40,
            ),
          ),
          Positioned(
            left: 29,
            bottom: 50,
            child: Text("Total balance",
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5,
                      fontSize: 20,
                    )),
          ),
          Positioned(
            left: 29,
            bottom: 20,
            child: Text(
              "₹ 80000.0",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
            ),
          ),
          Positioned(
            right: 29,
            bottom: 20,
            child: Text(
              widget.cardExpiryDate,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
