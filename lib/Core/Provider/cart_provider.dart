import 'package:flutter/material.dart';


import '../Models/cart_item.dart';
import '../Models/model_product.dart';
import '../Service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  CartService cartService = CartService();

  Map<String, CartItem> _cartItems = {};

  // getter to get cart items
  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  // getter to get cart items count
  int get itemsCount => _cartItems.length;

  double get totalPriceAmount {
    var total = 0.0;
    _cartItems.forEach((key, cardItem) {
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

  bool checkItemAddedToCart(String itemId) {
    if (_cartItems.containsKey(itemId)) {
      return true;
    } else {
      return false;
    }
  }

  List<CartItem> cartListItems(){
    var items = cartItems.values.toList();
    return items;
  }

  void increaseNumberOfItemsInCart(String itemId) {
    _cartItems.update(
        itemId,
            (existingCartItem) => CartItem(false, existingCartItem.url,
                existingCartItem.description, id: existingCartItem.id, title: existingCartItem.title,
                quantity: existingCartItem.quantity +1, price: existingCartItem.price));
    notifyListeners();
  }

  void decreaseNumberOfItemsInCart(String itemId) {
    _cartItems.update(
        itemId,
            (existingCartItem) => CartItem(false, existingCartItem.url,
                    existingCartItem.description, id: existingCartItem.id, title: existingCartItem.title,
                    quantity: (existingCartItem.quantity == 0) ? 0 : existingCartItem.quantity -1,
                        price: existingCartItem.price));
    notifyListeners();
  }

  void addItemToCart(String itemId, String title, double price, bool isFavorite,
      String description,String url,) {
    _cartItems.putIfAbsent(
        itemId,
            () => CartItem(isFavorite, url, description,
                id: itemId, title: title, quantity: 1, price: price));
    notifyListeners();
  }

  void removeItemFromCart(String itemId) {
    _cartItems.remove(itemId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  Future<List<CartModel>> get carts async {
    List<CartModel> cartList = [];
    await cartService.getCarts().then((value) {
      cartList = value;
    });
    if (cartList.isEmpty) {
      return [];
    } else {
      return cartList;
    }
  }

  Future<bool> addCart(CartModel model) async {
    return await cartService
        .addCart(model)
        .whenComplete(() => notifyListeners());
  }
}