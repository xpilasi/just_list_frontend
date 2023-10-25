import 'package:flutter/material.dart';

class Product {
  late String productName;
  late int productQuantity;
  late double productPrice;
  late UniqueKey key;
  final Color? productColor;
  bool activaded = true;

  Product({
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.activaded,
    required this.key,
    this.productColor,
  });
}
