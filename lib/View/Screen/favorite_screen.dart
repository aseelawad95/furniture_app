import 'package:flutter/material.dart';
import '../../Core/Models/model_product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final List<CartItem> mainItemList = CartItem.itemList;
    final List<CartItem> mainSofaItemList = CartItem.sofaList;
    final List<CartItem> itemsList = mainItemList
        .where((element) => element.isFavorite == true)
        .toList();
    final List<CartItem> sofaItemsList = mainSofaItemList
        .where((element) => element.isFavorite == true)
        .toList();
    final List<CartItem> chairList = CartItem.chairItem;
    final List<CartItem> armchairList = CartItem.armchairList;
    final List<CartItem> chairFavoriteList = chairList
        .where((element) => element.isFavorite == true)
        .toList();
    final List<CartItem> armFavoriteList = armchairList
        .where((element) => element.isFavorite == true)
        .toList();
    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Center(
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
             //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: itemsList.length == 0 ? Center(
                    child: Text('You have no Favorites'),
                  )
                  : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: itemsList.length,
                      itemBuilder: (context,index){
                            return Card(
                              elevation: 2,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                  width: 100,
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Expanded(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(itemsList[index].url),
                                      )),
                                      ListTile(
                                        title: Text(itemsList[index].title,style: TextStyle(fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                        subtitle: Text('\$${itemsList[index].price}',style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.bold),),
                                        trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                bool isFavorite = toggleIsFavorite(
                                                    itemsList[index].isFavorite);
                                                itemsList[index].isFavorite = isFavorite;
                                              });
                                            },
                                            icon: itemsList[index].isFavorite == true
                                                ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                                : Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                  }),
                ),
                Container(
                  child: sofaItemsList.length == 0 ? Center(
                   // child: Text('You have no Favorites'),
                  )
                     : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: sofaItemsList.length,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 2,
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 100,
                              height: 300,
                              child: Column(
                                children: [
                                  Expanded(child: Image.asset(sofaItemsList[index].url)),
                                  ListTile(
                                    title: Text(sofaItemsList[index].title,style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.black),),
                                    subtitle: Text('\$${sofaItemsList[index].price}',style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bool isFavorite = toggleIsFavorite(
                                                sofaItemsList[index].isFavorite);
                                            sofaItemsList[index].isFavorite = isFavorite;
                                          });
                                        },
                                        icon: sofaItemsList[index].isFavorite == true
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  child: chairFavoriteList.length == 0 ? Center(
                    // child: Text('You have no Favorites'),
                  )
                      : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: chairFavoriteList.length,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 2,
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 100,
                              height: 300,
                              child: Column(
                                children: [
                                  Expanded(child: Image.asset(chairFavoriteList[index].url)),
                                  ListTile(
                                    title: Text(chairFavoriteList[index].title,style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.black),),
                                    subtitle: Text('\$${chairFavoriteList[index].price}',style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bool isFavorite = toggleIsFavorite(
                                                chairFavoriteList[index].isFavorite);
                                            chairFavoriteList[index].isFavorite = isFavorite;
                                          });
                                        },
                                        icon: chairFavoriteList[index].isFavorite == true
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  child: armFavoriteList.length == 0 ? Center(
                    // child: Text('You have no Favorites'),
                  )
                      : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: armFavoriteList.length,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 2,
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 100,
                              height: 300,
                              child: Column(
                                children: [
                                  Expanded(child: Image.asset(armFavoriteList[index].url)),
                                  ListTile(
                                    title: Text(armFavoriteList[index].title,style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.black),),
                                    subtitle: Text('\$${armFavoriteList[index].price}',style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bool isFavorite = toggleIsFavorite(
                                                armFavoriteList[index].isFavorite);
                                            armFavoriteList[index].isFavorite = isFavorite;
                                          });
                                        },
                                        icon: armFavoriteList[index].isFavorite == true
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
    );

  }
}
