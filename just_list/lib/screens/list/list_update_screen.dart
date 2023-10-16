import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_list/models/product_model.dart';
import 'package:just_list/screens/list/list_board_screen.dart';

import '../../common/colors.dart';
import '../../common/sizes.dart';
import '../../common/texts.dart';
import '../../controllers/dashboard_controller.dart';
import '../../models/list_model.dart';
import '../../widgets/buttons/custom_buttons.dart';
import '../dashboard/dashboard.dart';
import '../product/product_create_screen.dart';

class UpdateListScreen extends StatelessWidget {
  const UpdateListScreen({Key? key, required this.nameOfTheList, this.listKey})
      : super(key: key);
  final String nameOfTheList;
  final UniqueKey? listKey;

  @override
  Widget build(BuildContext context) {
    final DashBoardController dashBoardController =
        Get.put(DashBoardController());
    final newListName = TextEditingController(text: nameOfTheList);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              tUpdateYourList,
              //style: const TextStyle(color: Colors.black),
            ),
            leading: CustomBackButton(onPressed: () => Get.back())),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(tDefaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 15,
                        textCapitalization: TextCapitalization.words,
                        controller: newListName,
                        decoration:
                            InputDecoration(label: Text(tLabelUpdateListName)),
                      ),
                      SizedBox(
                        height: tDefaultMargin - 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onPressed: () {
                            //Update List:
                            dashBoardController.updateListName(
                                listKey: listKey,
                                newListName: newListName.text);
                            //Return to the Lists:
                            Get.to(() => DashBoardScreen());
                          } //to get the text form the controller
                          ,
                          buttonText: tUpdateList,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
