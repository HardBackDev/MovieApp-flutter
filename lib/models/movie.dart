class Movie{
  late String id;
  late String directorId;
  late String title;
  late String description;
  late DateTime releaseDate;
  late List<String> genres;
  late String photoUrl;
  late String videoPath;
  late int goodRating;
  late int badRating;

  Movie({
    required this.id,
    required this.directorId,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.genres,
    required this.photoUrl,
    required this.videoPath,
    required this.goodRating,
    required this.badRating,
    }
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      directorId: json['directorId'],
      title: json['title'],
      description: json['description'],
      releaseDate: DateTime.parse(json['releaseDate']),
      genres: List<String>.from(json['genres']),
      photoUrl: json['photoUrl'],
      videoPath: json['videoPath'],
      goodRating: json['goodRating'],
      badRating: json['badRating'],
    );
  }
}