// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
//
// import '../Models/model_product.dart';
// import '../Service/product_service.dart';
//
// class ProductsProvider with ChangeNotifier {
//   ProductService productService = ProductService();
//
//   // getter
//   //  List<Product> get products => [..._products];
//   List<ProductItem> get products {
//     List<ProductItem> data = [];
//     productService.getProducts().then((value) {
//       data = value;
//     });
//     return data;
//   }
//
//   List<ProductItem> get offlineProducts {
//     List<ProductItem> data = [];
//    // var encryptedData = Prefs.getStringList('productsData');
//     Map<String, dynamic> encodedMap = {};
//     var productItem = ProductItem.empty();
//     for (var element in encryptedData!) {
//       encodedMap = json.decode(element);
//       productItem = ProductItem.fromJson(encodedMap);
//       data.add(productItem);
//     }
//     return data;
//   }
//
//   Future<List<ProductItem>> getProducts() async {
//     return await productService.getProducts();
//   }
//
//   Future<List<ProductItem>> getProductsIfFav() async {
//     return await productService.getProductsIfFav();
//   }
//
//   List<ProductItem> productsBySupCategories(
//       String category, String supCategory) {
//     return offlineProducts
//         .where((product) =>
//     product.category == category && product.supCategory == supCategory)
//         .toList();
//   }
//
//   List<ProductItem> get favoriteProducts {
//     return offlineProducts.where((product) => product.isFavorite!).toList();
//   }
//
//   Future<void> addProduct(ProductItem product) async {
//     await productService.addProduct(product).whenComplete(() {
//       refreshProvider();
//       notifyListeners();
//     }).catchError((err) {
//       log('addProduct method err : $err');
//     });
//   }
//
//   Future<void> updateProduct(String id, ProductItem product) async {
//     await productService.updateProduct(id, product);
//     refreshProvider();
//     notifyListeners();
//   }
//
//   Future<void> deleteProduct(String id) async {
//     await productService.deleteProduct(id);
//     refreshProvider();
//     notifyListeners();
//   }
//
//   ProductItem findProductById(String id) {
//     var result =  offlineProducts.firstWhere((product) => product.id == id,orElse: () => ProductModel.empty());
//     if(result == null){
//       refreshProvider();
//       result =  offlineProducts.firstWhere((product) => product.id == id);
//     }
//     return result;
//
//   }
//
//   String findOwnerIdByProductId(String id) {
//     return offlineProducts
//         .firstWhere((product) => product.id == id)
//         .ownerId
//         .toString();
//   }
//
//   Future<ProductItem> findProductByIdOnline(String id) async {
//     return products.firstWhere((product) => product.id == id);
//   }
//
//   void addProductToFavourite(String id) {
//     final product = offlineProducts.firstWhere((product) => product.id == id);
//     if (product.isFavorite == false) {
//       product.isFavorite = true;
//       productService.updateProduct(id, product);
//       refreshProvider();
//       notifyListeners();
//     }
//   }
//
//   void removeProductFromFavourite(String id) {
//     final product = offlineProducts.firstWhere((product) => product.id == id);
//     if (product.isFavorite!) {
//       product.isFavorite = false;
//       productService.updateProduct(id, product);
//       refreshProvider();
//       notifyListeners();
//     }
//   }
//
//   void refreshProvider() async {
//    // await Prefs.remove('productsData');
//     List<String> encryptedData = [];
//     String encodedMap = '';
//     ProductService productService = ProductService();
//     var productData = await productService.getProducts();
//     List<ProductItem> productDataList = productData;
//     for (var element in productDataList) {
//       encodedMap = json.encode(element.toJson());
//       encryptedData.add(encodedMap);
//     }
//     //Prefs.setStringList('productsData', encryptedData);
//   }
// }