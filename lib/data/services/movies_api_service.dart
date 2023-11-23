import 'dart:convert';

import 'package:flutter_application1/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService{

  Future<List<MovieModel>> fetchMovies() async{
    print("fetchMovies inside MovieService");
    
    final response = await http.get(Uri.parse("https://dummyapi.online/api/movies"));

    if(response.statusCode == 200){
      print("response movies: ${response.body}");
            print("response movies: ${json.decode(response.body)}");

      return List<MovieModel>.from((json.decode(response.body) as List).map((movie) => MovieModel.fromJson((movie)))).toList();
    } else{
      throw("Couldn't fetch movies");
    }
  }

}