import 'package:flutter/material.dart';
import 'package:movieapp/components/catigoryWidget.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/moviemodul.dart';

class Detailsspage extends StatelessWidget {
  final Movie movie;
  const Detailsspage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        width: screenwidth,
        height: screenheight,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //movie poster
              Container(
                padding:
                    const EdgeInsets.only(bottom: 5, left: 2.5, right: 2.5),
                width: screenwidth,
                height: screenheight * 0.45,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Constants.kPinkColor.withOpacity(0.65),
                      Constants.kGreenColor.withOpacity(0.65),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        movie.posterPath,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.kBlackColor.withOpacity(0.8),
                          Constants.kBlackColor.withOpacity(0.1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),

              //back and menu buttons
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenheight * 0.085,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: Constants.kWhiteColor)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          color: Constants.kWhiteColor.withOpacity(0.9),
                          Icons.keyboard_backspace,
                          size: screenwidth * 0.07,
                        ),
                      ),
                    ),
                    Container(
                      height: screenheight * 0.085,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: Constants.kWhiteColor)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          color: Constants.kWhiteColor.withOpacity(0.9),
                          Icons.menu,
                          size: screenwidth * 0.07,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //play button
              Positioned(
                right: screenwidth * 0.03,
                top: screenheight * 0.34,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: screenwidth * 0.15,
                  height: screenheight * 0.1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Constants.kPinkColor,
                        Constants.kGreenColor,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.kGreyColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Constants.kWhiteColor,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenheight * 0.46),

                  // movie name
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      '"${movie.title}"',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: screenwidth * 0.059,
                        fontWeight: FontWeight.w700,
                        color: Constants.kWhiteColor.withOpacity(0.80),
                      ),
                    ),
                  ),

                  SizedBox(height: screenheight * 0.02),

                  //movie's category
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CatigoryWidget(type: 'Epic'),
                      CatigoryWidget(type: 'Fantasy'),
                      CatigoryWidget(type: 'Drama'),
                      CatigoryWidget(type: 'motivate'),
                    ],
                  ),

                  SizedBox(height: screenheight * 0.02),

                  //movie's descreption
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      movie.overview,
                      style: TextStyle(
                          letterSpacing: 1.15,
                          fontSize: screenwidth * 0.045,
                          fontWeight: FontWeight.w300,
                          color: Constants.kWhiteColor.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.02),

                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      textAlign: TextAlign.left,
                      'TRAILER',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: screenwidth * 0.06,
                          fontWeight: FontWeight.w600,
                          color: Constants.kWhiteColor.withOpacity(0.8)),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.02),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: screenheight * 0.25,
                          width: screenwidth * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(movie.posterPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: screenheight * 0.25,
                          width: screenwidth * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [
                                  Constants.kBlackColor.withOpacity(0.8),
                                  Constants.kBlackColor.withOpacity(0.15),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                        Center(
                            child: Icon(
                          Icons.play_circle,
                          size: 75,
                          color: Constants.kWhiteColor.withOpacity(0.6),
                        )),
                      ],
                    ),
                  ),
                  //divider
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Divider(
                      color: Constants.kWhiteColor.withOpacity(0.4),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
