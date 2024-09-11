import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/components/TrendingTemp.dart';

class TrendingComp extends StatelessWidget {
  const TrendingComp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()
        ..add(
          FetchMoviesEvent(endpoint: 'popular'),
        ),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is IsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedMoviesState) {
            return TrendingTemplet(
              movies: state.movies,
            );
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}