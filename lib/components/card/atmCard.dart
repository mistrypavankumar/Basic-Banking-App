import 'package:basic_banking_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserATMCard extends StatefulWidget {

  final String cardNumber, cardHolderName,cardExpiryDate;

  UserATMCard({
    Key key,
    @required this.cardNumber,
    @required this.cardHolderName,
    @required this.cardExpiryDate,
    
  });
  
  @override
  _UserATMCardState createState() => _UserATMCardState();
}

class _UserATMCardState extends State<UserATMCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: mgDefaultPadding/2),
         height: 199,
         width: 344,
         decoration: BoxDecoration(
           gradient: mgPrimaryGradient,
           borderRadius: BorderRadius.all(
             Radius.circular(28),
           )
         ),
         child: Stack(
           children: [
             Positioned(
               left: 29,
               top: 48,
               child: Text(
                 "CARD NUMBER",
                 style: Theme.of(context).textTheme.subtitle2.copyWith(
                   color: Colors.white,
                   fontWeight: FontWeight.w300,
                   letterSpacing: .5
                 ),
                 ),
              ),
             Positioned(
               left: 29,
               top: 65,
               child: Text(
                 widget.cardNumber,
                 style: Theme.of(context).textTheme.headline6.copyWith(
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                   letterSpacing: .5
                 ),
                 ),
              ),
             Positioned(
               right: 21,
               top: 35,
               child:  SvgPicture.asset(cardsIcon[0], width: 40,),
               
              ),
             Positioned(
               left: 29,
               bottom: 45,
               child: Text(
                 "CARD HOLDER NAME",
                 style: Theme.of(context).textTheme.subtitle2.copyWith(
                   color: Colors.white,
                   fontWeight: FontWeight.w300,
                   letterSpacing: .5
                 ),
                 ),
              ), 
             Positioned(
               left: 29,
               bottom: 20,
               child: Text(
                 widget.cardHolderName,
                 style: Theme.of(context).textTheme.headline6.copyWith(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.w700,
                   letterSpacing: .5
                 ),
                 ),
              ), 
             Positioned(
               right: 23,
               bottom: 45,
               child: Text(
                 "EXPIRY DATE",
                 style: Theme.of(context).textTheme.subtitle2.copyWith(
                   color: Colors.white,
                   fontWeight: FontWeight.w300,
                   letterSpacing: .5
                 ),
                 ),
              ), 
             Positioned(
               right: 23,
               bottom: 20,
               child: Text(
                 widget.cardExpiryDate,
                 style: Theme.of(context).textTheme.headline6.copyWith(
                   color: Colors.white,
                   fontSize: 16,
                   fontWeight: FontWeight.w700,
                   letterSpacing: .5
                 ),
                 ),
              ), 
           ],
         ),
    );
  }
}