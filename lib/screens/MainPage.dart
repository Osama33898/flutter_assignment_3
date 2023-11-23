import 'package:flutter/material.dart';
import 'package:flutter_application1/screens/auth/widgets/button_custom.dart';
import 'package:flutter_application1/screens/movies_list/movie_screen_dio.dart';
import 'package:flutter_application1/screens/movies_list/movies_list_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
Future<void> naviagateToHttp(BuildContext context) async {

          
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MoviesListScreen()),
            );


  }
Future<void> naviagateToDio(BuildContext context) async {

    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MoviesListScreenDio()),
            );      

}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  MyButton(
                onTap: ()=>naviagateToHttp(context),
                textBtn: 'HTTP'
              ),
               MyButton(
                onTap: ()=>naviagateToDio(context),
                textBtn: 'DIO'
              ),
                
                ],
              )),
        ));

  }
}