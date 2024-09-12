import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/moviemodul.dart';
import 'package:movieapp/pages/detailsPage.dart';

class TrendingTemplet extends StatefulWidget {
  final List<Movie> movies;

  TrendingTemplet({
    super.key,
    required this.movies,
  });

  @override
  _TrendingTempletState createState() => _TrendingTempletState();
}

class _TrendingTempletState extends State<TrendingTemplet> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < widget.movies.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first page
      }

      // Animate the page change
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return Container(
      height: screenheight * 0.3,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length, //movies.length
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final movie = widget.movies[index];
          return Container(
            width: screenwidth,
            padding: const EdgeInsets.all(2.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Constants.kPinkColor.withOpacity(0.65),
                  Constants.kGreenColor.withOpacity(0.65),
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detailsspage(movie: movie)));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      movie.posterPath,
                    ), //movie.posterPath
                    fit: BoxFit.fill,
                  ),
                  color: Constants.kGreyColor,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Constants.kBlackColor.withOpacity(0.8),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
