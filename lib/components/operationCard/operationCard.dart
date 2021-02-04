import 'package:basic_banking_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationCard extends StatefulWidget {
  final String operation, operationIcon;
  final bool isSelected;

  OperationCard({ 
      this.operation, 
      this.operationIcon,
      this.isSelected,});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: mgDefaultPadding/2),
      height: 117,
      width: 117,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8,8),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? Colors.blue  : mgBgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset(
            widget.operationIcon, 
            fit: BoxFit.fill,
            width:40, 
            color: widget.isSelected ?  Colors.white : Colors.blue,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: widget.isSelected ?  Colors.white : Colors.grey[400],

            ),
            ),
          ),
        ],
      ),
    );
  }
}
