import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app/components/button.dart';
import 'package:resturant_app/screens/MenuPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 87, 79),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 25,),
          Text('Burger Lab',style:TextStyle(
            fontSize: 28,
            color: Colors.white
          ),),
                SizedBox(height: 25,),

     Padding(
       padding: const EdgeInsets.all(50.0), 
       child: Image.asset('assets/burgerr.png', height: MediaQuery.of(context).size.height*0.25,width: MediaQuery.of(context).size.width*0.25),
     ),
                     SizedBox(height: 25,),
Text('The Taste of Pakistan',style:TextStyle(
            fontSize: 44,
            color: Colors.white
          ),),
 SizedBox(height: 10,),
          Text('Burger labalanabab  jasajsaj kaskasjakska kahskahsaksa kajskajsakjskas ',style:TextStyle(
            // fontSize: 28,
            color: Colors.grey,
            height: 2
          ),),

                               SizedBox(height: 25,),

MyButton(text: 'Get Started',onTap: ()
{
  //  Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) =>  MenuPage()),
  //           );
  //goto

  Navigator.pushNamed(context, '/menupage');
},)

        ]),
      ),
   
      );
  }
}