import 'package:flutter/material.dart';
import 'package:flutter_application1/data/respository/movies_dio_repositories.dart';
import 'package:flutter_application1/models/movie_model.dart';


class MoviesProvider extends ChangeNotifier {
  List<MovieModel> movieModel = [];
  MoviesRepository _moviesRepository = MoviesRepository();

  MoviesProvider() {
    getMovies();
  }

  void getMovies() {
    print("getMovies inside provider");
    _moviesRepository.fetchMovies().then((value) {
      movieModel = value;
      notifyListeners();
    });
  }
}