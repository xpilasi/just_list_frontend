import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_list/common/colors.dart';
import 'package:just_list/common/sizes.dart';
import 'package:just_list/controllers/dashboard_controller.dart';
import 'package:just_list/screens/list/list_create_screen.dart';
import 'package:just_list/screens/product/product_create_screen.dart';

import '../../common/texts.dart';
import '../../widgets/content/content_widget.dart';
import '../../widgets/texts/cutoms_titles.dart';
import '../list/list_board_screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 59,
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: ProfileAvatar(),
            ),
            title: Text(
              tMyLists,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: tDefaultMargin - 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const CreateListScreen());
                      },
                      icon: Icon(
                        Icons.add,
                        size: tDefaultMargin,
                      ),
                    ),
                  ],
                ),
              )
            ]),
        body:
            // SingleChildScrollView(
            //   child:
            Padding(
          padding: EdgeInsets.symmetric(
              horizontal: tDefaultMargin - 15, vertical: tDefaultMargin - 25),
          child: Container(
              child: Column(
            children: [
              // CustomTextTitle(title: tMyLists),
              // SizedBox(
              //   height: tDefaultMargin - 10,
              // ),
              Expanded(
                flex: 2,
                child: GetBuilder<DashBoardController>(
                    builder: (dashBoardController) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: dashBoardController.lists.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 175,
                                  width: 175,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 0,
                                    child: ListTile(
                                      textColor: tWhite,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      tileColor: dashBoardController
                                          .lists[index].listColor,
                                      // trailing:
                                      //     const Icon(Icons.gpp_good_outlined),
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 0),
                                        child: ListDashBoardContent(
                                          listName: dashBoardController
                                              .lists[index].listName,
                                          totalCartList:
                                              dashBoardController.getTotalCart(
                                                  keyOfTheList:
                                                      dashBoardController
                                                          .lists[index]
                                                          .listKey),
                                        ),
                                      ),
                                      onTap: () => Get.to(ListBoardScreen(
                                        listKey: dashBoardController
                                            .lists[index].listKey,
                                        nameOfTheList: dashBoardController
                                            .lists[index].listName,
                                      )),
                                      onLongPress: () => showDialog(
                                        context: context,
                                        builder: (context) {
                                          return dashBoardController
                                              .showAlertDialog(
                                                  keyOftheList:
                                                      dashBoardController
                                                          .lists[index]
                                                          .listKey);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
              )
            ],
          )),
        ));
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: tTextColor,
      radius: 15,
      child: Text(
        tAcronym,
        style: TextStyle(fontSize: 13, color: tWhite),
      ),
    );
  }
}
