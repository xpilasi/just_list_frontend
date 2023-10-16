import 'package:get/get.dart';

import '../../common/colors.dart';

class CustomSnackBarOk {
  static showSnackbarOk({required String title, required String subtitle}) {
    Get.snackbar(title, subtitle,
        snackPosition: SnackPosition.TOP,
        backgroundColor: tSnackBarOk,
        colorText: tTextColor);
  }
}

class CustomSnackBarNotOk {
  static showSnackbarNotOk({required String title, required String subtitle}) {
    Get.snackbar(title, subtitle,
        snackPosition: SnackPosition.TOP,
        backgroundColor: tSnackBarNotOk,
        colorText: tTextColor);
  }
}
