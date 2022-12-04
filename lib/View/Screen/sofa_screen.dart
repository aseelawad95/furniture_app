import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Core/Models/model_product.dart';
import '../../Core/Models/route_model.dart';
import '../../Core/Provider/cart_provider.dart';
import '../../Core/Router/router_constant.dart';
import 'Widget/badge_widget.dart';



class SofaScreen extends StatefulWidget {
  const SofaScreen({Key? key}) : super(key: key);

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
  final List<CartItem> sofaItems = CartItem.sofaList;
  final bool isFavorite = false;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context,);
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
                  Text('Sofas',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(width: 100,),
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
                        color: Colors.black,size: 25,),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(11),
              child: ListView.builder(
                itemCount: sofaItems.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return Consumer(builder: (BuildContext context , CartProvider cart , _){
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailSofaScreen(
                            itemId: index,
                          )));
                    },
                    child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),),
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
                                    cartProvider.addItemToCart(sofaItems[index].id, sofaItems[index].title, sofaItems[index].price,
                                        sofaItems[index].isFavorite, sofaItems[index].description, sofaItems[index].url);
                                  });
                                },
                                icon: Icon(Icons.add_box_outlined,color: Colors.green,),
                              ),
                            ),
                            Expanded(child: Image.asset(sofaItems[index].url)),
                            ListTile(
                              title: Text(
                                sofaItems[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                '\$${sofaItems[index].price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool isFavorite = toggleIsFavorite(
                                          sofaItems[index].isFavorite);
                                      sofaItems[index].isFavorite = isFavorite;
                                    });
                                  },
                                  icon: sofaItems[index].isFavorite == true
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


class DetailSofaScreen extends StatefulWidget {
  const DetailSofaScreen({Key? key, required this.itemId}) : super(key: key);
  final int itemId;

  @override
  State<DetailSofaScreen> createState() => _DetailSofaScreenState();
}

class _DetailSofaScreenState extends State<DetailSofaScreen> {
  final List<CartItem> sofa = CartItem.sofaList;
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
                              Image.asset(sofa[widget.itemId].url),
                              ListTile(
                                title: Text(sofa[widget.itemId].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                subtitle: Text(sofa[widget.itemId].description,style: TextStyle(color: Colors.black
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

