import 'package:movieapp/models/actor.dart';
import 'movie.dart';

class MovieWithActors{
  late Movie movie;
  late List<Actor> actors;

  MovieWithActors(this.movie, this.actors);

  factory MovieWithActors.fromJson(Map<String, dynamic> json) {
    var movie = Movie.fromJson(json);
    List? actorsJson = json['actors'] as List;
    var actors = actorsJson[0] != null ? List<Actor>.from(
        (actorsJson).map((actorJson) => Actor(actorJson)),
      ) : List<Actor>.empty();
      
    return MovieWithActors(movie, actors);
  }
}