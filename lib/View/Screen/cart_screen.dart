import 'package:flutter/material.dart';
import 'package:furniture/Core/Models/route_model.dart';
import 'package:furniture/View/Screen/Widget/cart_item_widget.dart';
import 'package:provider/provider.dart';

import '../../Core/Models/model_product.dart';
import '../../Core/Provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.model,}) : super(key: key);
  final RouteModel model;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool isFavorite = false;
  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    var cart= Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                          icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                    ),
                    SizedBox(width: 100,),
                    Center(
                      child: Text('Cart',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: widget.model.cartItems.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(context,index){
                    return CartItemWidget(
                      id: widget.model.cartItems.toList()[index].id,
                      title: widget.model.cartItems.toList()[index].title,
                      quantity: widget.model.cartItems.toList()[index].quantity,
                        price: widget.model.cartItems.toList()[index].price,
                      url: widget.model.cartItems.toList()[index].url,);
                }),
              ),
              // ListView.builder(
              //     itemCount: widget.model.cartSofaItems.length,
              //     scrollDirection: Axis.vertical,
              //     physics: BouncingScrollPhysics(),
              //     shrinkWrap: true,
              //     itemBuilder:(context,index){
              //       return Card(
              //         elevation: 2,
              //         color: Colors.white10,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(5),
              //           child: SizedBox(
              //             width: 100,
              //             height: 400,
              //             child: Column(
              //               children: [
              //                 Image.asset(widget.model.cartSofaItems[index].url),
              //                 ListTile(
              //                   title: Text(
              //                     widget.model.cartSofaItems[index].title,
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.black),
              //                   ),
              //                   subtitle: Text(
              //                     '\$${widget.model.cartSofaItems[index].price}',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   trailing: IconButton(
              //                       onPressed: () {
              //                         setState(() {
              //                           bool isFavorite = toggleIsFavorite(
              //                               widget.model.cartSofaItems[index].isFavorite);
              //                           // widget.model.cartItems[index] = isFavorite;
              //                         });
              //                       },
              //                       icon: widget.model.cartSofaItems[index].isFavorite == true
              //                           ? Icon(
              //                         Icons.favorite,
              //                         color: Colors.red,
              //                       )
              //                           : Icon(
              //                         Icons.favorite_border,
              //                         color: Colors.black45,
              //                         size: 30,
              //                       )),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
              SizedBox(height: 20,),
              Center(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text('\$${widget.model.totalPrice}',style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 40),),
                    ),
                    ElevatedButton(onPressed:(){

                    },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green)
                        ),
                        child: Text('Buy'))
                  ],
                ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
