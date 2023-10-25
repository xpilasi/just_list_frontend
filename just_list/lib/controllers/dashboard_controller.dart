import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_list/common/colors.dart';
import 'package:just_list/common/texts.dart';
import 'package:just_list/models/list_model.dart';
import 'package:just_list/models/product_model.dart';
import 'package:just_list/models/saved_purchased_row.dart';
import 'package:just_list/widgets/buttons/custom_buttons.dart';
import 'package:just_list/widgets/snack_bars/snack_bar_widget.dart';

class DashBoardController extends GetxController {
  List<ListModel> lists = [];
  List<SavedPurchasedRow> savedPurchasedRows = [];

//To add a new list collection:
  void addList(ListModel listName) {
    lists.add(listName);
    //Show snackbar ok:
    CustomSnackBarOk.showSnackbarOk(
        title: tSnackBarListCreatedTitle,
        subtitle: tSnackBarListCreatedSubTitle);
    update(); //con esta función getx refresca la pantalla
  }

//To add a new Product List:
  newProductInList({required UniqueKey? keyList, required Product product}) {
    for (var list in lists) {
      if (list.listKey == keyList) {
        list.listProducts!.add(product);
        // //Show snackbar ok:
        CustomSnackBarOk.showSnackbarOk(
            title: tSnackBarCreated, subtitle: tSnackBarReason);
        update();
        break;
      }
    }
  }

//To get model list:
  ListModel getListModel({required UniqueKey? listKey}) {
    var modelList;
    for (var model in lists) {
      if (model.listKey == listKey) {
        modelList = model;
      }
    }
    return modelList;
  }

//To edit the product in the list
  updateProductInList({
    required UniqueKey? keyList,
    required Product product,
    required Product newProduct,
  }) {
    //Find the list key within the lists:
    for (var list in lists) {
      //Find the product key within the prod list:

      if (list.listKey == keyList) {
        //Iterate within the Product (name + price + qty):

        for (var prod in list.listProducts!) {
          //Find the correct product:

          if (product.key == prod.key) {
            product.productName = newProduct.productName;
            product.productPrice = newProduct.productPrice;
            product.productQuantity = newProduct.productQuantity;
            CustomSnackBarOk.showSnackbarOk(
                title: tSnackBarUpdatedTitle,
                subtitle: tSnackBarUpdatedSubtitle);
            update();
            break;
          }
        }
      }
    }
  }

//To remove a product
  removeProductInList({required UniqueKey? keyList, required Product product}) {
    //Iterate within the Lists and find the list key:

    for (var list in lists) {
      //Find the list key
      if (list.listKey == keyList) {
        //Iterate within the product list:

        for (var prod in list.listProducts!) {
          //Find the product with the key:
          if (prod.key == product.key) {
            try {
              list.listProducts!.remove(prod);
              print("Action successfully done");

              CustomSnackBarOk.showSnackbarOk(
                  title: tSnackBarOkRemovedtitle,
                  subtitle: tSnackBarOkRemovedSubtitle);
              update();
              break;
            } catch (e) {
              print(e);
              CustomSnackBarNotOk.showSnackbarNotOk(
                  title: "Error", subtitle: "Product removed from the list");
            }
          }
        }
      }
    }
  }

//To get the Product List:
  List<Product> getProductList({required UniqueKey? listKey}) {
    List<Product> productList = [];
    for (var list in lists) {
      final UniqueKey? keyList = listKey;

      if (list.listKey == keyList) {
        for (var l in list.listProducts!) {
          productList.add(l);
        }
      }
    }

    return productList;
  }

//To change switch state:
  bool changeSwitch(
      {required String listName,
      required UniqueKey? listKey,
      required bool value,
      required UniqueKey productKey}) {
    //List<Product> productList = getProductList(listKey: listKey);
    bool finalState = true;

    for (var list in lists) {
      final String nameList = listName;

      if (list.listName == nameList) {
        //Iterate within the products list:
        for (var l in list.listProducts!) {
          if (l.key == productKey) {
            // print("Changed Key: $productKey}");
            l.activaded = value;
            finalState = l.activaded;
            update();
            break;
          }
        }
      }
    }

    return finalState;
  }

  //To get ku

  //To get the total amount of the Cart:
  String getTotalCart({required UniqueKey? keyOfTheList}) {
    List<Product> productList = getProductList(listKey: keyOfTheList).obs;

    var totalCart = 0.0;

    for (var element in productList) {
      if (element.activaded) {
        totalCart += element.productPrice * element.productQuantity;
      }
    }

    return totalCart.toStringAsFixed(2); //2 decimals
  }

  removeProductList({required UniqueKey? listKey}) {
    for (var list in lists) {
      if (list.listKey == listKey) {
        lists.remove(list);
        Get.back();

        update();
        CustomSnackBarOk.showSnackbarOk(
            title: tSnackBarOkRemovedtitle,
            subtitle: tSnackBarListRemovedSubtitle);
        break;
      }
    }
  }

  //To show an alert dialog before removing the ProductList:
  showAlertDialog({required UniqueKey? keyOftheList}) {
    return CupertinoAlertDialog(
      title: Text(tDismissedAlert),
      content: Text(tDismissedListConfirmation),
      actions: [
        CustomDialogButton(
            buttonText: "Cancel",
            textColor: tPrimaryColor,
            onPressed: () => Get.back()),
        CustomDialogButton(
            textColor: tLightRed,
            buttonText: "Dismiss",
            onPressed: () {
              removeProductList(listKey: keyOftheList);
            }),
      ],
    );
  }

  //To get % of the cart by product

  String getPercentageOfTheProduct(
      {required Product product, required UniqueKey? listKey}) {
    double totalCart = double.parse(getTotalCart(keyOfTheList: listKey));
    String percentageOfTheProduct = "";
    String percentage = "";
    for (var list in lists) {
      if (list.listKey == listKey) {
        for (var prod in list.listProducts!) {
          if (prod.key == product.key) {
            if (prod.activaded == true) {
              percentageOfTheProduct =
                  (((prod.productPrice * prod.productQuantity) / totalCart) *
                          100)
                      .toStringAsFixed(0);
              percentage = "$percentageOfTheProduct%";
            } else {
              percentage = "0%";
            }
          }
        }
      }
    }
    return percentage;
  }

  //To add a new purchase historic row:
  newPurchaseRow(
      {required UniqueKey? keyOfTheList,
      required ListModel listModel,
      required String listName,
      required String cartTotal,
      required List<Product> productList}) {
    //Encontrar la lista inicial:
    for (var list in lists) {
      if (list.listKey == keyOfTheList) {
        final savedPurchasedRow = SavedPurchasedRow(
            rowKey: UniqueKey(),
            nameList: listName,
            totalCart: cartTotal,
            purchaseDate: DateTime.now(),
            cart: productList);

        listModel.historicPurchases!.add(savedPurchasedRow);
      }
    }
  }

  //To get the product list within the list:
  List<Product> getPurchaseRow({required UniqueKey? listKey}) {
    List<Product> productList = [];
    for (var list in lists) {
      if (list.listKey == listKey) {
        productList = list.listProducts!;
      }
    }
    return productList;
  }

  //To get the list of purchases within a list:
  List<SavedPurchasedRow> getPurchases({required UniqueKey? keyList}) {
    var modelList;
    for (var list in lists) {
      if (list.listKey == keyList) {
        modelList = list.historicPurchases!;
      }
    }
    return modelList;
  }

  //To Update the list name:
  updateListName({required UniqueKey? listKey, required String newListName}) {
    for (var list in lists) {
      if (listKey == list.listKey) {
        list.listName = newListName;
        update();
      }
    }
  }
  // String getDateFormated(DateTime dateTime) {
  //   String dateString = dateTime.toString();

  //   String Year = dateTime.substring(0,12)
  // }

//TODO:
//Show empty cart if productList is empty
//Add Cart icon OK
//Add ipnut icons OK
//Validate inputs OK
//Dismissible : delete product OK
//Edit product screen OK

//Improve front end style: buttons,colors,fonts,sizes

  //Title lists OK
  //Improve appbar dashboard OK
  //Make appbar flexible
  //All screen on products
  //All screen on lists
}
