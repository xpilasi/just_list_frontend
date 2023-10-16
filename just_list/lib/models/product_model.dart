import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:just_list/models/saved_purchased_row.dart';

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
