
class CartModel {
  String? id;
  String? name;
  double? price;
  bool isFavorite=false;
  String? url;
  String? description;

  CartModel({this.id,this.name, this.price,this.url,
    required this.isFavorite,this.description});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    isFavorite = json['isFavorite'];
    url = json['url'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['isFavorite'] = isFavorite;
    data['url'] = url;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'CartModel{id: $id, name: $name, price: $price, isFavorite: $isFavorite, url: $url, description: $description}';
  }
  static List<CartModel> itemList=[
    CartModel( isFavorite:false,  url:'assets/images/armchair(5).png', id: '1',
        name: 'Classic Leather Arm Chai', price: 122.0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim" ),
    CartModel(isFavorite: false,url:'assets/images/Item_2.png' ,
        id: '2',name: 'Poppy Plastic Tub Chair', price: 200.0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"),
    CartModel( isFavorite:false,url:'assets/images/chair(1).png' ,
      id: '3', name: 'Bar Stool Chair',  price: 300.0,
      description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),

  ];
}

