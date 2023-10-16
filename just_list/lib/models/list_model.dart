//TODO:

//Modelo de lista

import 'package:flutter/material.dart';
import 'package:just_list/models/saved_purchased_row.dart';

import 'product_model.dart';

class ListModel {
  late String listName;
  final List<Product>? listProducts;
  final UniqueKey? listKey;
  final Color? listColor;
  final List<SavedPurchasedRow>? historicPurchases;

  ListModel(
      {required this.listName,
      this.listProducts,
      this.listKey,
      this.listColor,
      this.historicPurchases});
}
