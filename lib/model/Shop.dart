import 'package:flutter/material.dart';
import 'package:resturant_app/model/Food.dart';

class Shop extends ChangeNotifier{

  
 final List<Food> _foodMenu = [
    Food(
        name: "Beef Burger",
        price: '600',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
          
           Food(
        name: "Chicken Burger",
        price: '400',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
         Food(
        name: "Lamb Burger",
        price: '680',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
         Food(
        name: "Beef Burger",
        price: '600',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
         Food(
        name: "Beef Burger",
        price: '600',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
         Food(
        name: "Beef Burger",
        price: '600',
        imagePath: 'assets/burgerr.png',
        rating: "5.0"
        ),
    ];

     final List<Food> _cart =[];

       List<Food> get foodMenu=>_foodMenu;
        List<Food> get cart=>_cart;

        void addToCard(Food food,int quantity)
        {
          for(int i=0;i<quantity;i++){
_cart.add(food);
          }
          notifyListeners();
        }

        
        void removeCard(Food food)

        {
_cart.remove(food);
           
                    notifyListeners();
    }




}