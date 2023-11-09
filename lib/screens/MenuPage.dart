import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/Style.dart';
import 'package:resturant_app/components/FoodTile.dart';
import 'package:resturant_app/components/button.dart';
import 'package:resturant_app/model/Food.dart';
import 'package:resturant_app/model/Resturant.dart';
import 'package:resturant_app/model/Shop.dart';
import 'package:resturant_app/screens/FoodDetailpage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
// List<ResturantModel> list = new List();
//  List foodMenu = [
//     Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
          
//            Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
//          Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
//          Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
//          Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
//          Food(
//         name: "Beef Burger",
//         price: '600',
//         imagePath: 'assets/burgerr.png',
//         rating: "5.0"
//         ),
//     ];
    void navigateToFoodDetailPage(int index)
    {
      final shop=context.read<Shop>();
      final foodMenu=shop.foodMenu;


      Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetailPage(food:foodMenu[index])),);
    }
  @override
  Widget build(BuildContext context) {
    final shop=context.read<Shop>();
      final foodMenu=shop.foodMenu;

 return Scaffold(
  backgroundColor: Color.fromARGB(255, 250, 245, 245),
    appBar: AppBar(
      
      backgroundColor: Colors.transparent,
      foregroundColor: const Color.fromARGB(255, 133, 126, 126),
      elevation: 0,
      // title: const Text('Islamabad')),
      leading: Icon(Icons.menu, ),
      title: Text('Islamabad',),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/cartpage');
        }
        , icon: Icon(Icons.shopping_cart)),
      ],
    ),
    body:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(color: primary_color,borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          padding: EdgeInsets.symmetric(vertical:25 ,horizontal:40 ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:
           [
            
Column(
  children: [
          //message
                Text('Get 40% Promo',style: TextStyle(fontSize: 20,color: Colors.white),),
                          SizedBox(height: 20,),
//btn
                MyButton(text: 'Redeem', onTap: (){

                })

  ],
)     ,     
           //image 

           Image.asset('assets/burgerr.png',height: 80,width: 80,)
           ],),
        ),


//search bar
                                        SizedBox(height: 25),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child:   TextField(
  
  
  
    decoration: InputDecoration(
  
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20)),

    ),
  
  ),
),
//menu list

                                        SizedBox(height: 25),
Padding(
  
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child:   Text('Food Menu',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
),
                                        SizedBox(height: 10),




  Expanded(child: ListView.builder(   scrollDirection: Axis.horizontal,    itemCount:foodMenu.length,itemBuilder: (context,index)=>FoodTile(
    food: foodMenu[index],onTap:()=>navigateToFoodDetailPage(index)
  ))),
                                        


//popular food
// Container(
//   decoration: BoxDecoration(
//     color: Colors.grey,
//     borderRadius: BorderRadius.circular(20)
//   ),
//   margin: EdgeInsets.only(left:25,right: 25,bottom: 25),
//   padding: EdgeInsets.all(20),
// child: Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Image.asset('assets/burgerr.png',height: 60,),
//                             SizedBox(height: 20,),

//     Column(
//       children: [
//         Text(
//           "Salads ",
//           style: TextStyle(fontSize: 10),
          
//         ),
//                         SizedBox(height: 25,),
// Text(
//           "\$ 44 ",
//           style: TextStyle(color: Colors.grey),
          
//         ),
//       ],
//     ),
//     Icon(Icons.favorite_outline,color: Colors.grey,size: 20,)
//   ],
// )
// ,
// ),
      ],



    )


  );
 }
}