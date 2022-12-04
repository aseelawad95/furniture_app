import 'package:flutter/material.dart';
import 'package:furniture/Core/Models/model_product.dart';
import 'package:furniture/View/Screen/detial_screen.dart';
import 'package:provider/provider.dart';
import '../../Core/Models/route_model.dart';
import '../../Core/Provider/cart_provider.dart';
import '../../Core/Router/router_constant.dart';
import 'Widget/badge_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CartItem> items = CartItem.itemList;
  final bool isFavorite = false;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
                width: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      ' DashBorder',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(width: 155,),
                  Consumer< CartProvider>(builder: (context,cartData,child){
                    return Badge(
                      value: cartData.itemsCount.toString(),
                      color: Colors.red,
                      child: child!,);
                  },
                    child: IconButton(
                      onPressed: (){
                        var model = RouteModel(
                          cartItems: cartProvider.cartListItems(),
                          totalPrice: cartProvider.totalPriceAmount,
                        );
                        Navigator.of(context).pushNamed(cartItemRout,arguments: model);
                      },
                      icon: Icon(Icons.shopping_cart,
                        color: Colors.black,),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 7)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('All',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 17),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(sofaScreen);
                    },
                      child: Text('Sofas',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 17),)),
                  InkWell(
                    onTap: (){
                     Navigator.of(context).pushNamed(chairScreen);
                    },
                      child: Text('Chairs',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 17),)),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(armchairScreen);
                    },
                      child: Text('Armchairs',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 17),)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Consumer(builder: (BuildContext context , CartProvider cart , _){
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                itemId: index,
                              )));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
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
                                     cartProvider.addItemToCart(items[index].id, items[index].title, items[index].price,
                                         items[index].isFavorite, items[index].description, items[index].url);
                                      });
                                     // Navigator.of(context).pushNamed(cartScreen);
                                    },
                                    icon: Icon(Icons.add_box_outlined,color: Colors.green,),
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    fit: BoxFit.fill,
                                      items[index].url),
                                ),
                                ListTile(
                                  title: Text(
                                    items[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    '\$${items[index].price}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          bool isFavorite = toggleIsFavorite(
                                              items[index].isFavorite);
                                          items[index].isFavorite = isFavorite;
                                        });
                                      },
                                      icon: items[index].isFavorite == true
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
