import 'package:flutter/material.dart';
import 'package:movieapp/components/searchbar.dart';
import 'package:movieapp/components/spotwidget.dart';
import 'package:movieapp/components/trendingComp.dart';
import 'package:movieapp/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.kBlackColor,
        body: Stack(
          children: [
            SpotWidget(color: Constants.kGreenColor, right: -170),
            SpotWidget(color: Constants.kPinkColor, left: -170),
            SpotWidget(
              color: Constants.kPinkColor,
              left: -200,
              top: screenwidth * 0.8,
            ),
            SpotWidget(
              color: Constants.kGreenColor,
              right: -200,
              top: screenwidth * 0.8,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Searchbar(height: screenheight, width: screenwidth),
                  SizedBox(height: screenheight * 0.02),
                  Padding(
                      padding: EdgeInsets.only(left: screenwidth * 0.01),
                      child: Text(
                        textAlign: TextAlign.start,
                        'TRENDING MOVIES',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: screenwidth * 0.052,
                            fontWeight: FontWeight.w600,
                            color: Constants.kGreyColor),
                      ),
                    ),
                    SizedBox(height: screenheight * 0.01),
                    TrendingComp(),
                    SizedBox(height: screenheight * 0.02),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
