import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';

class CatigoryWidget extends StatelessWidget {
  final String type;
  const CatigoryWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Constants.kGreyColor),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          type,
          style: TextStyle(
            color: Constants.kBlackColor.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
