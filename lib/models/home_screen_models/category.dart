import 'package:flutter/material.dart';

class Category {
  String categoryName;
  Color color; //
  String imageUrl;

  Category({this.categoryName, this.color, this.imageUrl});
}

List<Category> categoryData = <Category>[
  Category(
      categoryName: "Pizza", color: Colors.red.withOpacity(0.5), imageUrl: ""),
  Category(categoryName: "Breakfast", color: Colors.purple.withOpacity(0.5)),
  Category(categoryName: "Drink", color: Colors.green.withOpacity(0.5)),
  Category(categoryName: "Pizza", color: Colors.yellow.withOpacity(0.5))
];
