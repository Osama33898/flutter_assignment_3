import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application1/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService{

  Future<List<MovieModel>> fetchMovies() async{
    print("fetchMovies inside MovieServiceDIO");
    var dio=Dio();

    try{
    final  response = await dio.get("https://dummyapi.online/api/movies");
          print("response movies OSAMAMAMAMAMAMAMAMMA: ${response.data}");

    if(response.statusCode == 200){
            print("response movies OSAMAMAMAMAMAMAMAMMA !!!!!!!!!: ${response}");

      return List<MovieModel>.from((response as List).map((movie) => MovieModel.fromJson((movie)))).toList();
    }
    else
    {
      return [];
    }


    } on DioException catch(e)
    {
      
            throw("Couldn't fetch movies");

    }
    

    // if(response.statusCode == 200){
    //   print("response movies: ${response.body}");
    //   return List<MovieModel>.from((json.decode(response.body) as List).map((movie) => MovieModel.fromJson((movie)))).toList();
    // } else{
    //   throw("Couldn't fetch movies");
    // }
  }

}