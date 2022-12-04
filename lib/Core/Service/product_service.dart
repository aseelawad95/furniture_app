// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../Models/model_product.dart';
//
// class ProductService {
//   int? statusCode;
//   String? msg;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<List<ProductItem>> getProducts() async {
//     List<ProductItem> products = [];
//     Map<String, dynamic> category = {};
//     ProductItem productItem;
//     QuerySnapshot categoriesData =
//     await _firestore.collection('products').get();
//     for (var item in categoriesData.docs) {
//       category['id'] = item.get('id');
//       category['title'] = item.get('title');
//       category['description'] = item.get('description');
//       category['ownerId'] = item.get('ownerId');
//       category['categoryId'] = item.get('categoryId');
//       category['category'] = item.get('category');
//       category['supCategoryId'] = item.get('supCategoryId');
//       category['supCategory'] = item.get('supCategory');
//       category['price'] = item.get('price');
//       category['evaluate'] = item.get('evaluate');
//       category['imageUrl'] = item.get('imageUrl');
//       category['isFavorite'] = item.get('isFavorite');
//       category['isRecommended'] = item.get('isRecommended');
//       productItem = ProductItem.fromJson(category);
//       products.add(productItem);
//     }
//     return products;
//   }
//
//   Future<List<ProductItem>> getRecommendedProducts() async {
//     List<ProductItem> products = [];
//     Map<String, dynamic> category = {};
//     ProductItem productModel;
//     QuerySnapshot categoriesData = await _firestore
//         .collection('products')
//         .where('isRecommended', isEqualTo: true)
//         .get();
//     for (var item in categoriesData.docs) {
//       category['id'] = item.get('id');
//       category['title'] = item.get('title');
//       category['description'] = item.get('description');
//       category['ownerId'] = item.get('ownerId');
//       category['categoryId'] = item.get('categoryId');
//       category['category'] = item.get('category');
//       category['supCategoryId'] = item.get('supCategoryId');
//       category['supCategory'] = item.get('supCategory');
//       category['price'] = item.get('price');
//       category['evaluate'] = item.get('evaluate');
//       category['imageUrl'] = item.get('imageUrl');
//       category['isFavorite'] = item.get('isFavorite');
//       category['isRecommended'] = item.get('isRecommended');
//       productModel = ProductItem.fromJson(category);
//       products.add(productModel);
//     }
//     return products;
//   }
//
//   Future<List<ProductItem>> getProductsIfFav() async {
//     List<ProductItem> products = [];
//     Map<String, dynamic> category = {};
//     ProductItem productModel;
//     QuerySnapshot categoriesData = await _firestore
//         .collection('products')
//         .where('isFavorite', isEqualTo: true)
//         .get();
//     for (var item in categoriesData.docs) {
//       category['id'] = item.get('id');
//       category['title'] = item.get('title');
//       category['description'] = item.get('description');
//       category['ownerId'] = item.get('ownerId');
//       category['categoryId'] = item.get('categoryId');
//       category['category'] = item.get('category');
//       category['supCategoryId'] = item.get('supCategoryId');
//       category['supCategory'] = item.get('supCategory');
//       category['price'] = item.get('price');
//       category['evaluate'] = item.get('evaluate');
//       category['imageUrl'] = item.get('imageUrl');
//       category['isFavorite'] = item.get('isFavorite');
//       category['isRecommended'] = item.get('isRecommended');
//       productModel = ProductItem.fromJson(category);
//       products.add(productModel);
//     }
//     return products;
//   }
//
//   Future<void> addProduct(ProductItem productModel) async {
//     _firestore
//         .collection('products')
//         .add(productModel.toJson())
//         .whenComplete(() {
//       statusCode = 200;
//      // Prefs.setBool('haveAnyChange', true);
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log(msg!);
//     });
//   }
//
//   Future<ProductItem> updateProduct(
//       String id, ProductItem productModel) async {
//     QuerySnapshot productData = await _firestore
//         .collection('products')
//         .where('id', isEqualTo: id)
//         .get();
//     String documentId = productData.docs[0].id;
//     _firestore
//         .collection('products')
//         .doc(documentId)
//         .update(productModel.toJson())
//         .whenComplete(() {
//       //Prefs.setBool('haveAnyChange', true);
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log(msg!);
//     });
//     return productModel;
//   }
//
//   Future<void> deleteProduct(String id) async {
//     QuerySnapshot categoryData = await _firestore
//         .collection('products')
//         .where('id', isEqualTo: id)
//         .get();
//     String documentId = categoryData.docs[0].id;
//     return _firestore
//         .collection('products')
//         .doc(documentId)
//         .delete()
//         .whenComplete(() {
//      // Prefs.setBool('haveAnyChange', true);
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log(msg!);
//     });
//   }
//
//   void handleAuthErrors(ArgumentError error) {
//     String errorCode = error.message;
//     switch (errorCode) {
//       case "ABORTED":
//         {
//           statusCode = 400;
//           msg = "The operation was aborted";
//         }
//         break;
//       case "ALREADY_EXISTS":
//         {
//           statusCode = 400;
//           msg = "Some document that we attempted to create already exists.";
//         }
//         break;
//       case "CANCELLED":
//         {
//           statusCode = 400;
//           msg = "The operation was cancelled";
//         }
//         break;
//       case "DATA_LOSS":
//         {
//           statusCode = 400;
//           msg = "Unrecoverable data loss or corruption.";
//         }
//         break;
//       case "PERMISSION_DENIED":
//         {
//           statusCode = 400;
//           msg =
//           "The caller does not have permission to execute the specified operation.";
//         }
//         break;
//       default:
//         {
//           statusCode = 400;
//           msg = error.message;
//         }
//         break;
//     }
//   }
// }