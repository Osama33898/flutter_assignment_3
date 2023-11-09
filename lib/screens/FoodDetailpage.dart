import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/Style.dart';
import 'package:resturant_app/components/button.dart';
import 'package:resturant_app/model/Food.dart';
import 'package:resturant_app/model/Shop.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key,required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {

  int quantityCount=0;
  void decrementQuantity()
  {
    if(quantityCount>0)
    {
    setState(() {
      quantityCount--;
    });
    }
  }
    void incrementQuantity()
  {
    setState(() {
      quantityCount++;
    });
  }
  void addTocart()
  {
if(quantityCount>0)
{
  final shop=context.read<Shop>();
  shop.addToCard(widget.food, quantityCount);

  showDialog(context: context,barrierDismissible: false,builder: (context)=>AlertDialog(
    backgroundColor: primary_color,
    content: Text('SuccessFully added to cart',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
    actions: [
      IconButton(onPressed: (){
        Navigator.pop(context);
        Navigator.pop(context);

      }, icon: Icon(Icons.done))
    ],
  ));

}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //lsistvieww of food detials
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:25),
              child: ListView(
                children: [
                  //image
                  Image.asset(widget.food.imagePath,height: 200,),
                  const SizedBox(width: 25,),
            
            
            
                  //rating 
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                                    const SizedBox(height: 25,),
            
                                    //rating number
            
                                    Text(widget.food.rating,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
            
                  ],
                ),

                //food name

                Text(
                  widget.food.name,style: TextStyle(
                    fontSize: 20
                  ),

                  
                ),
                                                    const SizedBox(height: 20,),

                                                     Text(
                  'Descrition',style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),

                  
                ),
                                                    const SizedBox(height: 20,),


Text('Best Burger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad rger BEst bruger jjjj gogogo kksdjsdjsdadad ',style: TextStyle(
  color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,height: 1.5
),),



                                                    const SizedBox(height: 25,),

                  //desc


                ],
              ),
            )
          ),


          //price qiality add to card btn

          Container(
            color: primary_color,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //price qty
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text(
    '\$'+ widget.food.price, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
  ),
  //qty
  Row(
    children: [
//minus btn
Container(
  decoration: BoxDecoration(color: sec_color,shape: BoxShape.circle),
  child: IconButton(onPressed: decrementQuantity, icon: Icon(Icons.remove,color: Colors.white,)),
),

//qty 
SizedBox(
  width: 40,
  child: Center(child: Text(quantityCount.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),))),

//plus btn
Container(
  decoration: BoxDecoration(color: sec_color,shape: BoxShape.circle),
  child: IconButton(onPressed: incrementQuantity, icon: Icon(Icons.add,color: Colors.white,)),
)
  ],)
],),

                //btn add card
                                                    const SizedBox(height: 10,),

                MyButton(text:'Add to Cart', onTap: addTocart)
              ],
            ),
          )
        ],
      ),
    );
  }
}