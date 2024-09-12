import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/moviemodul.dart';
import 'package:movieapp/pages/detailsPage.dart';

class MovieTemple extends StatelessWidget {
  final List<Movie> movies;
  final double height;
  final double width;
  MovieTemple(
      {super.key,
      required this.movies,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return Container(
      height: screenheight * height,
      child: ListView.builder(
        itemCount: movies.length, //movies.length
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return Container(
            width: screenwidth * width,
            height: screenheight * height,
            margin: EdgeInsets.only(right: screenwidth * 0.03),
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
                      image: NetworkImage(movie.posterPath), //movie.posterPath
                      fit: BoxFit.fill,
                    ),
                    color: Constants.kGreyColor),
              ),
            ),
          );
          ;
        },
      ),
    );
  }
}
