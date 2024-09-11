import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/components/movieTemplet.dart';

class UpcomingComp extends StatelessWidget {
  const UpcomingComp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(FetchMoviesEvent(endpoint: 'upcoming'));

    return BlocProvider(
      create: (context) => MovieBloc()
        ..add(
          FetchMoviesEvent(endpoint: 'upcoming'),
        ),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is IsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedMoviesState) {
            return MovieTemple(
              movies: state.movies,
              height: 0.17,
              width: 0.6,
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
