import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/util/dimensions.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: Dimensions.WEB_MAX_WIDTH,
    duration: Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    borderRadius: Dimensions.RADIUS_SMALL,
    isDismissible: true,
    //dismissDirection: Snack//SnackDismissDirection.HORIZONTAL,//SnackDismissDirection.HORIZONTAL,
  ));
}