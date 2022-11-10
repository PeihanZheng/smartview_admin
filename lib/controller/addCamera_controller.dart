import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCameraController extends GetxController {
  final nameTC = TextEditingController();
  final linkTC = TextEditingController();
  final addressTC = TextEditingController();

  @override
  void onClose() {
    nameTC.dispose();
    linkTC.dispose();
    addressTC.dispose();
    super.onClose();
  }

  clearData() {
    nameTC.clear();
    linkTC.clear();
    addressTC.clear();
  }
}
