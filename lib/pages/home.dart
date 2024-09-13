import 'package:flutter/material.dart';
import 'package:movieapp/components/searchbar.dart';
import 'package:movieapp/components/spotwidget.dart';
import 'package:movieapp/components/topratedComp.dart';
import 'package:movieapp/components/trendingComp.dart';
import 'package:movieapp/components/upcomingComp.dart';
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
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  Searchbar(height: screenheight, width: screenwidth),
                  SizedBox(height: screenheight * 0.02),
                  //TEXT
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
                  //WIDGET
                  const TrendingComp(),
                  SizedBox(height: screenheight * 0.02),
                  //TEXT
                  Padding(
                    padding: EdgeInsets.only(left: screenwidth * 0.01),
                    child: Text(
                      textAlign: TextAlign.start,
                      'UPCOMING',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: screenwidth * 0.052,
                          fontWeight: FontWeight.w600,
                          color: Constants.kGreyColor),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.01),
                  //WIDGET
                  const UpcomingComp(),

                  SizedBox(height: screenheight * 0.02),

                  //TEXT
                  Padding(
                    padding: EdgeInsets.only(left: screenwidth * 0.01),
                    child: Text(
                      textAlign: TextAlign.start,
                      'TOP RATED',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: screenwidth * 0.052,
                          fontWeight: FontWeight.w600,
                          color: Constants.kGreyColor),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.01),
                  //WIDGET
                  const TopratedComp(),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            padding: const EdgeInsets.all(2),
            width: screenwidth * 0.18,
            height: screenheight * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Constants.kPinkColor.withOpacity(0.9),
                  Constants.kGreenColor.withOpacity(0.9),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Constants.kGreyColor.withOpacity(0.8),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.tv,
                size: screenwidth * 0.12,
                color: Constants.kWhiteColor.withOpacity(0.9),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.1),
                Constants.kPinkColor.withOpacity(0.075),
                Constants.kGreenColor.withOpacity(0.075),
                Constants.kGreenColor.withOpacity(0.1),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 1.5,
              color: Constants.kWhiteColor.withOpacity(0.2),
            ),
          ),
          height: screenheight * 0.085,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: Constants.kWhiteColor.withOpacity(0.9),
                  Icons.home,
                  size: screenwidth * 0.09,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: Constants.kWhiteColor.withOpacity(0.9),
                  Icons.favorite,
                  size: screenwidth * 0.09,
                ),
              ),
              const Text(''),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: Constants.kWhiteColor.withOpacity(0.9),
                  Icons.watch_later_rounded,
                  size: screenwidth * 0.09,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: Constants.kWhiteColor.withOpacity(0.9),
                  Icons.download,
                  size: screenwidth * 0.09,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
