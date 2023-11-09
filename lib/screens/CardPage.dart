import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/Style.dart';
import 'package:resturant_app/components/button.dart';
import 'package:resturant_app/model/Food.dart';
import 'package:resturant_app/model/Shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food,BuildContext context)
  {
final shop =context.read<Shop>();
shop.removeCard(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context,value,child)=> Scaffold(
      backgroundColor: primary_color,
      appBar: AppBar(title: Text('My Cart'),
      elevation: 0,
      backgroundColor: primary_color,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
          
              
              itemBuilder: (context,index){
                final Food food =value.cart[index];
                final String foodName=food.name;
                final String foodPrice=food.price;
                return Container(
                  decoration: BoxDecoration(
                    color: sec_color,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.only(left: 20,top: 20,right: 20),
                  child: ListTile(
                    title: Text(foodName, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text(foodPrice, style: TextStyle(color: Colors.grey),),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed:(){ removeFromCart(food,context);}
                    ),
                  ),
                );
          
              //gt food from cart
          
              //get food name
          
              //get fod prive
          
              //return list title 
            }),
          ),

          //PAY BTNNN

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(text: 'Pay Now', onTap: (){
          
            }),
          )
        ],
      ),
    ));
  }
}