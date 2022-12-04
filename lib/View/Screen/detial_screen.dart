import 'package:flutter/material.dart';
import 'package:furniture/Core/Models/model_product.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.itemId}) : super(key: key);
  final int itemId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<CartItem> itemList = CartItem.itemList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Image.asset(itemList[widget.itemId].url),
                        ListTile(
                          title: Text(itemList[widget.itemId].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          subtitle: Text(itemList[widget.itemId].description,style: TextStyle(color: Colors.black
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
