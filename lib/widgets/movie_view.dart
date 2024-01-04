import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_with_actors.dart';

class MovieView extends StatelessWidget {
  final MovieWithActors movieWithActors;

  MovieView({
    required this.movieWithActors
  });

  @override
  Widget build(BuildContext context) {
    var poster = movieWithActors.movie.photoUrl.startsWith("data")
                ? MemoryImage(base64.decode(movieWithActors.movie.photoUrl.substring("data:image/jpeg;base64,".length))) 
                : NetworkImage(movieWithActors.movie.photoUrl) as ImageProvider;

    return Card(
      elevation: 500,
      child: Column( // the movie view column
        children: [
          Row( // the poster, title, genres and actors row
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container( // Movie Poster
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: poster,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded( // Title, Genres, and Actors
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieWithActors.movie.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1, 
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Genres: ${movieWithActors.movie.genres.join(', ')}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Actors: ${movieWithActors.actors.map((e) => e.name).take(2).join(', ')}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ]
          ),
          Row( // the desc and ratings row
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _truncateDescription(movieWithActors.movie.description),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.thumb_up),
                          SizedBox(width: 10),
                          Text(movieWithActors.movie.goodRating.toString()),
                          SizedBox(width: 50),
                          Icon(Icons.thumb_down),
                          SizedBox(width: 10),
                          Text(movieWithActors.movie.badRating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Truncate the description if it's too long
  String _truncateDescription(String description) {
    const int maxDescriptionLength = 150;
    return description.length > maxDescriptionLength
        ? description.substring(0, maxDescriptionLength) + '...'
        : description;
  }
}

// Example usage:
// MovieView(
//   posterUrl: 'https://example.com/path/to/poster.jpg',
//   title: 'Movie Title',
//   genres: ['Action', 'Drama'],
//   actors: ['Actor 1', 'Actor 2', 'Actor 3'],
//   description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
//   likes: 100,
//   dislikes: 20,
// )
