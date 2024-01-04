import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:movieapp/models/movie_with_actors.dart';
import 'package:movieapp/services/environment.dart';
import 'package:http/http.dart' as http;

class MovieCubit extends Cubit<List<MovieWithActors>> {
  static const String url = "${Environment.apiUrl}/movies/withActors?actorsCount=2";
  
  MovieCubit() : super([]){
    getMoviesWithActors();
  }

  void getMoviesWithActors({String params = ""}) async {
    String query = params.isEmpty ? url : "$url&$params";
    print(query);
    final response = await http.get(Uri.parse(query));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      emit(jsonList.map((e) => MovieWithActors.fromJson(e)).toList());
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
