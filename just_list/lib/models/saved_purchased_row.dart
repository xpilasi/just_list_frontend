import 'package:flutter/cupertino.dart';
import 'package:just_list/models/product_model.dart';

class SavedPurchasedRow {
  final String totalCart;
  final UniqueKey rowKey;
  final DateTime purchaseDate;
  final String nameList;
  final List<Product> cart;

  SavedPurchasedRow(
      {required this.totalCart,
      required this.rowKey,
      required this.purchaseDate,
      required this.nameList,
      required this.cart});
}
