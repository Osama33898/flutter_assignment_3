import 'dart:js';

import 'package:flutter/material.dart';
import 'package:resturant_app/model/Shop.dart';
import 'package:resturant_app/screens/CardPage.dart';
import 'package:resturant_app/screens/HomePage.dart';
import 'package:resturant_app/screens/MenuPage.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(create:(context)=>Shop(),child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/homepage':(context)=>HomePage(),
        '/menupage':(context)=>MenuPage(),
        '/cartpage':(context)=>CartPage(),

      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
 
 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
// //     return Scaffold(
// //       appBar: AppBar(
       
// //        backgroundColor: Colors.transparent,
// //        elevation: 0,
// //        leading: IconButton(
// //         onPressed: () {
          
// //         },
// //         icon: Icon(
// //           Icons.arrow_back,
// //           size: 27
// //           )

// //         ),
// //         actions: [
// //           IconButton(onPressed: (){}, icon: Icon(Icons.search,size:27,color: Colors.grey,))

// //         ],

// //       ),
// //       body:SafeArea(child: SingleChildScrollView(child: Container(
// //         padding: EdgeInsets.symmetric(horizontal: 15),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             SizedBox(height: 20,),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text('Today s special',style: TextStyle(fontSize:26,fontWeight: FontWeight.w700 ), ),
// //                 Container(
// //                   child: Column(
// //                     children: [
// //                       Container(
// //                         padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.all(Radius.circular(25)),
// //                            color:Colors.green
// //                           ),
// //                           child: Center(
// // child: Row(
// //   mainAxisAlignment: MainAxisAlignment.center,
// //   children: [
// //     Icon(Icons.add_shopping_cart,color: Colors.white,size:18),
// //     Text('CART',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w700)
// //     )

// //   ],
// // ),
// //                           ),
                        
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //                 Container(
// //                   padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
// //                   margin: EdgeInsets.symmetric(horizontal: 10),
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20)),
// //                     color: Colors.green.withOpacity(0.7)

// //                   ),
// //                 )

// //               ],
// //             ),
// //             SizedBox(height: 10,),
// //             Text('Find what cooking today',style: TextStyle(
// //               color:Colors.grey,fontSize: 15
// //             ),
            
// //             ),
// // SizedBox(height: 15,),
// // SingleChildScrollView(
// //   padding: EdgeInsets.only(bottom: 20),
// //   scrollDirection: Axis.horizontal,
// //   child: Row(
// //     children: [Container(
// //       width: MediaQuery.of(context).size.width*0.55,
// //       height: 350,
// //       padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.all(Radius.circular(30)),
// //         color: Colors.blue,
// //         boxShadow: [BoxShadow(spreadRadius: 0,offset: Offset(0,10),blurRadius: 0,color: Colors.blue.withOpacity(0.4))
        
// //         ]
// //       ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Expanded(child: 
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(image: AssetImage('assets/burger.png')
                    
// //                     )
// //                   ),
// //                 ))
// //                 ,SizedBox(height: 15,),
// //                 Text('Burger',style: TextStyle(
// //                   color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700
// //                 ),),
// //                 SizedBox(
// //                   height: 5,
// //                 ),
// //                 Row(
// //                   children: [
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                                         Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Text('250 Ratings',style: TextStyle(
// //                       color: Colors.white,fontSize: 10,
// //                     ),)

// //                   ],
                
// //                 ),
// //                 SizedBox(height: 10,),
// //                 Text('Burger is the kjjjjjjjjjjjjjjjj',style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 13
// //                 ),)
// //               ],
// //             ),
// //     ),
// //     SizedBox(height: 10,),
// //     Column(
// //       children: [
// //         Container(
// //           width: MediaQuery.of(context).size.width*0.35,
// //           height: 165,
// //           padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.all(Radius.circular(30)),
// //             color: Colors.green,
// //             boxShadow: [BoxShadow(spreadRadius: 0,offset: Offset(0,10),blurRadius: 0,color: Colors.green.withOpacity(0.4))
        
// //         ]
// //           ),
// //           child:       Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Expanded(child: 
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(image: AssetImage('assets/burger.png')
                    
// //                     )
// //                   ),
// //                 ))
// //                 ,SizedBox(height: 15,),
// //                 Text('Burger',style: TextStyle(
// //                   color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700
// //                 ),),
// //                 SizedBox(
// //                   height: 5,
// //                 ),
// //                 Row(
// //                   children: [
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                                         Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Icon(Icons.star,color: Colors.white,size:17,),
// //                     Text('250 Ratings',style: TextStyle(
// //                       color: Colors.white,fontSize: 10,
// //                     ),)

// //                   ],
                
// //                 ),
// //                 SizedBox(height: 10,),
// //                 Text('Burger is the kjjjjjjjjjjjjjjjj',style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 13
// //                 ),)
// //               ],
// //             ),

// //         )
// //       ],
// //     )
// //     ],
    
// //   ),
// // )
// //           ],
// //         ),
// //       ),)),
// //     // This trailing comma makes auto-formatting nicer for build methods.
// //     );
//   }
// }
