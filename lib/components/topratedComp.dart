import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/components/movieTemplet.dart';

class TopratedComp extends StatelessWidget {
  const TopratedComp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()
        ..add(
          FetchMoviesEvent(endpoint: 'top_rated'),
        ),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is IsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedMoviesState) {
            return MovieTemple(
              movies: state.movies,
              height: 0.25,
              width: 0.42,
            );
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container(); // default empty state
        },
      ),
    );
  }
}
