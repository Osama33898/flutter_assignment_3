import 'dart:convert';

import 'package:flutter_application1/data/local_storage/DatabaseHelper.dart';


List<MovieModel> movieFromJson(String str) => List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieToJson(List<MovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    required this.movie,
    required this.image,
    required this.rating,
    //required this.releaseYear,
    //this.genre,
  });

  String movie;
  String image;
  double rating;
 // int releaseYear;
  //List<String>? genre;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    movie: json["movie"],
    image:'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6762_AL_.jpg',
    // image: json["image"],
    rating: json["rating"].toDouble(),
    //releaseYear: json["releaseYear"],
   // genre: List<String>.from(json["genre"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "movie": movie,
    "image": image,
    "rating": rating,
    //"releaseYear": releaseYear,
   // "genre": List<dynamic>.from(genre!.map((x) => x)),
  };

  Map<String, dynamic> toMap(){
    return {
      DbHelper.COLUMN_TITLE:movie,
      DbHelper.COLUMN_IMAGE:image,
      //DbHelper.COLUMN_RELEASE_YEAR:releaseYear,
      DbHelper.COLUMN_RATING:rating,
    };
  }
}