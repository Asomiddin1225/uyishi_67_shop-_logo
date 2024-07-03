// class ProductModel {
//   String id;
//   String title;
//   String description;
//   double rating;
//   double price;
//   String firstColorImage;
//   String productInfo;
//   bool isLiked;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.productInfo,
//     required this.rating,
//     required this.price,
//     required this.firstColorImage,
//     required this.isLiked,
//   });
  
// }





import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  String id;
  String title;
  String description;
  double rating;
  double price;
  String firstColorImage;
  String productInfo;
  bool isLiked;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.productInfo,
    required this.rating,
    required this.price,
    required this.firstColorImage,
    required this.isLiked,
  });

  // Add methods to update properties and notify about changes
  void updateIsLiked(bool newValue) {
    isLiked = newValue;
    notifyListeners(); // Notify listeners about the change
  }

  // Add similar methods for other properties if needed
}