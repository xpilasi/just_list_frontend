import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_list/common/colors.dart';
import 'package:just_list/common/sizes.dart';
import 'package:just_list/controllers/dashboard_controller.dart';
import 'package:just_list/screens/dashboard/dashboard.dart';
import 'package:just_list/screens/list/list_update_screen.dart';
import 'package:just_list/screens/product/product_create_screen.dart';
import 'package:just_list/screens/product/product_update.screen.dart';
import 'package:just_list/screens/purchases/purchases_screen.dart';

import '../../common/texts.dart';

import '../../widgets/buttons/custom_buttons.dart';

class ListBoardScreen extends StatelessWidget {
  final String nameOfTheList;
  final UniqueKey? listKey;
  ListBoardScreen(
      {Key? key, required this.nameOfTheList, required this.listKey})
      : super(key: key);

  @override
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  Widget build(BuildContext context) {
    //info from de mobile:
    var mediaQuery = MediaQuery.of(context);
    //Getting the size of the mobile device screen:
    var screenSize = mediaQuery.size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: tSecondaryColor,
            onPressed: () {
              Get.to(() => CreateProductScreen(
                    nameOfTheList: nameOfTheList,
                    keyOftheList: listKey,
                  ));
            },
            child: Icon(
              Icons.add,
              color: tWhite,
            )),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 122,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: tDefaultMargin - 10, vertical: 0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            nameOfTheList,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.history),
                                  onPressed: () {
                                    Get.to(PurchasesScreen(
                                        listname: nameOfTheList,
                                        historicPurchaseRows:
                                            dashBoardController.getPurchases(
                                                keyList: listKey)));
                                  }),
                              IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Get.to(UpdateListScreen(
                                        listKey: listKey,
                                        nameOfTheList: nameOfTheList));
                                  }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppBarButton(
                              size: 94,
                              text: tMyLists,
                              onPressed: () => Get.to(DashBoardScreen())),
                          const SizedBox(
                            width: 255,
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              )
            ]),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: tDefaultMargin - 15),
          child: Container(
              //color: tWhite,
              child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    //Header --> List title + total cart:
                    GetBuilder<DashBoardController>(
                        builder: (dashboardController) => Flexible(
                              child: Container(
                                height: 58,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                            Icons.shopping_cart_outlined),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Total Cart: \$ ${dashBoardController.getTotalCart(
                                            keyOfTheList: listKey,
                                          )}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            icon: const Icon(Icons.save_alt),
                                            onPressed: () {
                                              dashBoardController
                                                  .newPurchaseRow(
                                                      cartTotal:
                                                          dashBoardController
                                                              .getTotalCart(
                                                        keyOfTheList: listKey,
                                                      ),
                                                      keyOfTheList: listKey,
                                                      listName: nameOfTheList,
                                                      listModel:
                                                          dashboardController
                                                              .getListModel(
                                                                  listKey:
                                                                      listKey),
                                                      productList:
                                                          dashboardController
                                                              .getPurchaseRow(
                                                                  listKey:
                                                                      listKey));
                                              Get.to(
                                                PurchasesScreen(
                                                    listname: nameOfTheList,
                                                    historicPurchaseRows:
                                                        dashBoardController
                                                            .getPurchases(
                                                                keyList:
                                                                    listKey)),
                                              );
                                            })
                                      ],
                                    ),
                                    SizedBox(
                                      height: tDefaultMargin - 20,
                                    ),
                                  ],
                                ),
                              ),
                            )),

                    SizedBox(
                      height: screenSize / 1.4,
                      child: Container(
                        //color: tPrimaryColor,
                        child: GetBuilder<DashBoardController>(
                            builder: (dashBoardController) => ListView.builder(
                                  itemCount: dashBoardController
                                      .getProductList(listKey: listKey)
                                      .length,
                                  itemBuilder: (context, index) {
                                    var productList = dashBoardController
                                        .getProductList(listKey: listKey);

                                    var roundedRectangleBorder =
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20));
                                    return Dismissible(
                                      key: productList[index].key,
                                      onDismissed: (direction) =>
                                          (dashBoardController
                                              .removeProductInList(
                                                  keyList: listKey,
                                                  product: productList[index])),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //Wrap the ListTile with a Card:
                                          Card(
                                            elevation: 0.5,
                                            shape: roundedRectangleBorder,
                                            child: ListTile(
                                              textColor: tWhite,
                                              shape: roundedRectangleBorder,
                                              tileColor: tDark,
                                              leading: CircleAvatar(
                                                  backgroundColor:
                                                      productList[index]
                                                          .productColor,
                                                  child: Text(
                                                    productList[index]
                                                        .productName[0],
                                                    style: TextStyle(
                                                        color: tWhite),
                                                  )),
                                              trailing: Container(
                                                // color: tDarkPurpleS,
                                                width: 140,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      dashBoardController
                                                          .getPercentageOfTheProduct(
                                                              product:
                                                                  productList[
                                                                      index],
                                                              listKey: listKey),
                                                      style: TextStyle(
                                                          color: tTurkS,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    CupertinoSwitch(
                                                      activeColor:
                                                          tPrimaryColor,
                                                      value: productList[index]
                                                          .activaded,
                                                      onChanged:
                                                          (bool newValue) {
                                                        dashBoardController
                                                            .changeSwitch(
                                                                listKey:
                                                                    listKey,
                                                                listName:
                                                                    nameOfTheList,
                                                                productKey:
                                                                    productList[
                                                                            index]
                                                                        .key,
                                                                value:
                                                                    newValue);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              subtitle: Text(
                                                "${productList[index].productQuantity} x \$ ${productList[index].productPrice}",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              title: Text(
                                                  "${productList[index].productName}",
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                              onTap: () =>
                                                  Get.to(UpdateProductScreen(
                                                keyOfTheList: listKey,
                                                nameOfTheList: nameOfTheList,
                                                fullProduct: productList[index],
                                              )),
                                            ),
                                          ),
                                          //ListTile separation:
                                          // const SizedBox(
                                          //   height: 10,
                                          // ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                      ),
                    ),
                    //)
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
