import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartview_admin/themes/colors.dart';

import '../themes/textstyles.dart';

customSnackbar({String? message, bool? isSuccess}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isSuccess! ? Colors.green : Colors.red,
      borderRadius: 20,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      snackPosition: SnackPosition.TOP,
      messageText: Text(
        message!,
        style: textstyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: isSuccess ? textcolor : whitecolor,
          letterSpacing: .5,
        ),
      ),
    ),
  );
}
