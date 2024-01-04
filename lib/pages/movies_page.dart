import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubits/movie_cubit.dart';
import 'package:movieapp/models/movie_with_actors.dart';
import 'package:movieapp/widgets/movie_view.dart';

class MoviePage extends StatelessWidget {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          controller: _controller,
          decoration: InputDecoration(labelText: 'Search by title...', 
          labelStyle: TextStyle(color: Colors.white)),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => {
                print("search by \"${_controller.value.text}\""),
                context.read<MovieCubit>().getMoviesWithActors(params: "SearchedTitle=${_controller.value.text}")
              },
              child: Text("Search"),
            ),
            Container(width: 10,),
            ElevatedButton(
              onPressed: () => {},
              child: Text("Filter"),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<MovieCubit, List<MovieWithActors>>(
            builder: (context, state) {
              return ListView(
                  children: [
                    for (var m in state)
                      MovieView(movieWithActors: m),
                  ],
                );
            },
          ),
        )
      ],
    );
  }
}
