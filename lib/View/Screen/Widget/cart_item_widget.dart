import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.id,
    required this.title, required this.quantity, required this.price,
    required this.url,}) : super(key: key);
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String url;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: SizedBox(
          width: 100,
          height: 300,
          child: Column(
            children: [
              Expanded(child: Image.asset(url)),
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  '\$${price}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //Divider(thickness: 8,color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}
