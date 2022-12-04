class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  late bool isFavorite;
  final String url;
  final String description;

  CartItem(this.isFavorite,  this.url, this.description,
      {required this.id,
    required this.title,
    required this.quantity,
    required this.price,}
  );

  @override
  String toString() {
    return 'ProductItem{id: $id, title: $title, quantity: $quantity, price: $price, isFavorite: $isFavorite, url: $url}';
  }

  static List<CartItem> itemList=[
    CartItem( false,  'assets/images/armChairs/armchair(1).png', id: '1',
        title: 'Classic Leather Arm Chair', quantity: 3, price: 122.0,
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim" ),
    CartItem( false,'assets/images/Chairs/chair(2).png' ,
        id: '2', title: 'Occasional Chair', quantity: 5, price: 200.0,
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"),
    CartItem( false,'assets/images/Sofas/sofa(3).png' ,
        id: '3', title: 'Modern Chair', quantity: 7, price: 300.0,
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(3).png' ,
      id: '4', title: 'Club Chair', quantity: 9, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
  ];
  static List<CartItem> armchairList=[
    CartItem( false,  'assets/images/armChairs/armchair(2).png', id: '5',
        title: 'Classic Leather Arm Chair', quantity: 1, price: 122.0,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim" ),
    CartItem( false,'assets/images/armChairs/armchair(4).png' ,
        id: '6', title: 'Poppy Plastic Tub Chair', quantity: 2, price: 200.0,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"),
    CartItem( false,'assets/images/armChairs/armchair(5).png' ,
      id: '7', title: 'Bar Stool Chair', quantity: 3, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(6).png' ,
      id: '8', title: 'Bar Stool Chair', quantity: 4, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(7).png' ,
      id: '9', title: 'Bar Stool Chair', quantity: 5, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(8).png' ,
      id: '10', title: 'Bar Stool Chair', quantity: 6, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(9).png' ,
      id: '11', title: 'Bar Stool Chair', quantity: 7, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(10).png' ,
      id: '12', title: 'Bar Stool Chair', quantity: 8, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
    CartItem( false,'assets/images/armChairs/armchair(11).png' ,
      id: '13', title: 'Bar Stool Chair', quantity: 9, price: 300.0,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),


  ];
  static List<CartItem> sofaList=[
    CartItem(false, 'assets/images/Sofas/sofa(8).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '14', title: 'Ingrit MV', quantity: 1, price: 3000.0),
    CartItem(false, 'assets/images/Sofas/sofa(9).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '15', title: 'Ingrit MV', quantity:2 , price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(10).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '16', title: 'Ingrit MV', quantity: 3, price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(1).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '17', title: 'Ingrit MV', quantity: 4, price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(2).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '18', title: 'Ingrit MV', quantity: 5, price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(7).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '19', title: 'Ingrit MV', quantity: 6, price: 150.0),
    CartItem(false, 'assets/images/Sofas/sofa(4).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '20', title: 'Ingrit MV', quantity: 7, price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(5).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '21', title: 'Ingrit MV', quantity: 8, price: 350.0),
    CartItem(false, 'assets/images/Sofas/sofa(6).png',
        'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.',
        id: '22', title: 'Ingrit MV', quantity: 9, price: 350.0),


  ];
 static List<CartItem> chairItem = [
   CartItem( false,'assets/images/Chairs/chair(3).png' ,
     id: '25', title: 'Bar Stool Chair', quantity: 79, price: 300.0,
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
   CartItem( false,'assets/images/Chairs/chair(5).png' ,
     id: '26', title: 'Bar Stool Chair', quantity: 70, price: 300.0,
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
   CartItem( false,'assets/images/Chairs/chair(6).png' ,
     id: '27', title: 'Bar Stool Chair', quantity: 70, price: 300.0,
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),
   CartItem( false,  'assets/images/Chairs/chair(1).png', id: '23',
       title: 'Classic Leathers Chair', quantity: 36, price: 122.0,
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim" ),
   CartItem( false,'assets/images/Chairs/chair(4).png' ,
       id: '24', title: 'Poppy Plastic Tub Chair', quantity: 50, price: 200.0,
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"),
   CartItem( false,'assets/images/Chairs/chair(7).png' ,
     id: '27', title: 'Bar Stool Chair', quantity: 79, price: 300.0,
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",),

  ];
}
