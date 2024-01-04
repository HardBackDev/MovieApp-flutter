import 'dart:convert';

import 'package:movieapp/models/movie_with_actors.dart';
import 'package:movieapp/services/environment.dart';
import 'package:http/http.dart' as http;

class MovieService{
  static const String url = "${Environment.apiUrl}/movies/withActors?actorsCount=2";

  static Future<List<MovieWithActors>> getMovieWithActors({String queryParams = ""}) async {
    String query = queryParams.isEmpty ? url : "$url&$queryParams";

    final response = await http.get(Uri.parse(query));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => MovieWithActors.fromJson(e)).toList();
    } else {
      
      throw Exception('Failed to load user');
    }
  }

  static Future<MovieWithActors> getMovie(String id) async {
    final response = await http.get(Uri.parse("$url/$id"));

    if (response.statusCode == 200) {
      return MovieWithActors.fromJson(jsonDecode(response.body));
    } else {
      
      throw Exception('Failed to load user');
    }
  }
}