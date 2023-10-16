import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_list/common/colors.dart';
import 'package:just_list/common/sizes.dart';
import 'package:intl/intl.dart';

import '../../controllers/dashboard_controller.dart';
import '../../models/product_model.dart';
import '../../models/saved_purchased_row.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen(
      {Key? key, required this.historicPurchaseRows, required this.listname})
      : super(key: key);
  final String listname;
  final List<SavedPurchasedRow> historicPurchaseRows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          toolbarHeight: 92,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("$listname history purchase"),
        ),
        body: Padding(
          padding: EdgeInsets.all(tDefaultMargin - 15),
          child: Container(
            //color: tPink,
            child: GetBuilder<DashBoardController>(
                builder: (dashBoardController) => ListView.builder(
                      itemCount: historicPurchaseRows.length,
                      itemBuilder: (context, index) {
                        var roundedRectangleBorder = RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20));
                        String fullDate =
                            historicPurchaseRows[index].purchaseDate.toString();
                        String shortDate =
                            "${fullDate.substring(9, 10)}/${fullDate.substring(6, 7)}/${fullDate.substring(0, 4)}";
                        return
                            //Wrap the ListTile with a Card:
                            Card(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: roundedRectangleBorder,
                          child: ListTile(
                            tileColor: Colors.transparent,
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: tSnackBarNotOk,
                              ),
                              onPressed: null,
                            ),
                            leading: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  shortDate,
                                  style: TextStyle(color: tPrimaryColor),
                                ),
                              ],
                            ),
                            title: Text(
                                "Total cart: \$ ${historicPurchaseRows[index].totalCart}"),
                          ),
                        );
                      },
                    )),
          ),
        ));
    ;
  }
}
