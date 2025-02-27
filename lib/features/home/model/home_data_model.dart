class Movie {
  final int id;
  final String title;
  final int year;
  final List<String> genre;
  final double rating;
  final String director;
  final List<String> actors;
  final String plot;
  final String poster;
  final String trailer;
  final int runtime;
  final String awards;
  final String country;
  final String language;
  final String boxOffice;
  final String production;
  final String website;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? "Unknown",
      year: json['year'] ?? 0,
      genre: (json['genre'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? ["Unknown"],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      director: json['director'] ?? "Unknown",
      actors: (json['actors'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? ["Unknown"],
      plot: json['plot'] ?? "Unknown",
      poster: json['poster'] ?? "Unknown",
      trailer: json['trailer'] ?? "Unknown",
      runtime: json['runtime'] ?? 0,
      awards: json['awards'] ?? "Unknown",
      country: json['country'] ?? "Unknown",
      language: json['language'] ?? "Unknown",
      boxOffice: json['boxOffice'] ?? "Unknown",
      production: json['production'] ?? "Unknown",
      website: json['website'] ?? "Unknown",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genre': genre,
      'rating': rating,
      'director': director,
      'actors': actors,
      'plot': plot,
      'poster': poster,
      'trailer': trailer,
      'runtime': runtime,
      'awards': awards,
      'country': country,
      'language': language,
      'boxOffice': boxOffice,
      'production': production,
      'website': website,
    };
  }
}
