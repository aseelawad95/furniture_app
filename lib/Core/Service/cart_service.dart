import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/cart_item.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'carts';

  int statusCode = 0;
  String msg = '';

  Future<List<CartModel>> getCarts() async {
    try {
      QuerySnapshot query =
      await _firestore.collection(collectionName).get().catchError((err) {
        handleAuthErrors(err);
      });

      List<CartModel> result = [];
      for (var item in query.docs) {
        var data = CartModel(isFavorite: false);
        data.id = item.get('id');
        data.name = item.get('name');
        data.price = item.get('price');
        result.add(data);
      }
      return result;
    } on Exception catch (error) {
      log('error : $error');
      return [];
    }
  }

  Future<bool> addCart(CartModel model) async {
    try {
      _firestore
          .collection(collectionName)
          .add(model.toJson())
          .catchError((err) {
        handleAuthErrors(err);
      });
      return true;
    } on Exception catch (error) {
      log('error : $error');
      return false;
    }
  }

  void handleAuthErrors(ArgumentError error) {
    String errorCode = error.message;
    switch (errorCode) {
      case "ABORTED":
        {
          statusCode = 400;
          msg = "The operation was aborted";
        }
        break;
      case "ALREADY_EXISTS":
        {
          statusCode = 400;
          msg = "Some document that we attempted to create already exists.";
        }
        break;
      case "CANCELLED":
        {
          statusCode = 400;
          msg = "The operation was cancelled";
        }
        break;
      case "DATA_LOSS":
        {
          statusCode = 400;
          msg = "Unrecoverable data loss or corruption.";
        }
        break;
      case "PERMISSION_DENIED":
        {
          statusCode = 400;
          msg =
          "The caller does not have permission to execute the specified operation.";
        }
        break;
      default:
        {
          statusCode = 400;
          msg = error.message;
        }
        break;
    }
    log('msg : $msg');
  }
}