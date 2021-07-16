import 'package:flutter/material.dart';

class Category {
  String? categoryName;
  String? icon;
  int? managerID;

  Category({this.categoryName, this.managerID, this.icon});

  factory Category.fromDbtoModel(Map data) {
    return Category(
        categoryName: data['name'],
        icon: data['icon'],
        managerID: data['manager']);
  }
}
