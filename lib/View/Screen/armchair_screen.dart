import 'package:flutter/material.dart';
import 'package:furniture/View/Screen/sofa_screen.dart';
import 'package:provider/provider.dart';

import '../../Core/Models/model_product.dart';
import '../../Core/Models/route_model.dart';
import '../../Core/Provider/cart_provider.dart';
import '../../Core/Router/router_constant.dart';
import 'Widget/badge_widget.dart';

class ArmchairScreen extends StatefulWidget {
  const ArmchairScreen({Key? key}) : super(key: key);

  @override
  State<ArmchairScreen> createState() => _ArmchairScreenState();
}

class _ArmchairScreenState extends State<ArmchairScreen> {
  final List<CartItem> armchairItems = CartItem.armchairList;
  final bool isFavorite = false;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    var cartChair = Provider.of<CartProvider>(context,);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  ),
                  SizedBox(width: 100,),
                  Text('ArmChairs',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(width: 80,),
                  Consumer< CartProvider>(builder: (context,cartData,child){
                    return Badge(
                      value: cartData.itemsCount.toString(),
                      color: Colors.red,
                      child: child!,);
                  },
                    child: IconButton(
                      onPressed: (){
                        var model = RouteModel(
                          cartItems: cartChair.cartListItems(),
                          totalPrice: cartChair.totalPriceAmount,
                        );
                        Navigator.of(context).pushNamed(cartItemRout,arguments: model);
                      },
                      icon: Icon(Icons.shopping_cart,
                        color: Colors.black,size: 25,),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(11),
                child: ListView.builder(
                    itemCount: armchairItems.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Consumer(builder: (BuildContext context , CartProvider cart , _){
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailArmChairScreen(
                                  itemId: index,
                                )));
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 300,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () async{
                                        setState(() {
                                          cartChair.addItemToCart(armchairItems[index].id, armchairItems[index].title, armchairItems[index].price,
                                              armchairItems[index].isFavorite, armchairItems[index].description, armchairItems[index].url);
                                        });
                                      },
                                      icon: Icon(Icons.add_box_outlined,color: Colors.green,),
                                    ),
                                  ),
                                  Expanded(child: Image.asset(armchairItems[index].url)),
                                  ListTile(
                                    title: Text(
                                      armchairItems[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      '\$${armchairItems[index].price}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bool isFavorite = toggleIsFavorite(
                                                armchairItems[index].isFavorite);
                                            armchairItems[index].isFavorite = isFavorite;
                                          });
                                        },
                                        icon: armchairItems[index].isFavorite == true
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite_border,
                                          color: Colors.black45,
                                          size: 30,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    }),)
            ],
          ),
        ),
      ),
    );
  }
}

class DetailArmChairScreen extends StatefulWidget {
  const DetailArmChairScreen({Key? key, required this.itemId}) : super(key: key);
  final int itemId;

  @override
  State<DetailArmChairScreen> createState() => _DetailArmChairScreenState();
}

class _DetailArmChairScreenState extends State<DetailArmChairScreen> {
  final List<CartItem> armchair = CartItem.armchairList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 2,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Image.asset(armchair[widget.itemId].url),
                              ListTile(
                                title: Text(armchair[widget.itemId].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                subtitle: Text(armchair[widget.itemId].description,style: TextStyle(color: Colors.black,
                                ),),
                              )
                            ],
                          ),
                        ),
                      );
                    }),)
            ],
          ),
        ),
      ),
    );
  }
}