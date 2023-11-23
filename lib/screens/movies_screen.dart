import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application1/models/movie_model.dart';
import 'package:flutter_application1/views/setup/setup_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoviesScreenDetails extends StatelessWidget {
  final MovieModel movie;
 Future<void> moveToChat(BuildContext context) async {

          
    

          
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SetupPage()),
            );
           
  }
  MoviesScreenDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.movie as String),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                    tag: "${movie.movie}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                         height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,

                          image: CachedNetworkImageProvider(
                              movie.image)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  RatingBarIndicator(
                      rating: (movie.rating / 2),
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      }),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Title : ${movie.movie}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Text(
                    "Description:",
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(movie.movie),
                  ),
                ],
              )),
        )
       
       ,
       floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.black,
  onPressed: (() {
   moveToChat(context);
  }),
        ),);
  }
  
}