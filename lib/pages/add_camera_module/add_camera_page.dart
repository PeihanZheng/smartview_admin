import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartview_admin/controller/addCamera_controller.dart';

import '../../themes/colors.dart';
import '../../themes/textstyles.dart';
import '../../widgets/common_widgets.dart';

class AddCameraPage extends StatelessWidget {
  AddCameraPage({Key? key}) : super(key: key);

  final addCamCon = Get.put(AddCameraController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: appbarTitleWidget(),
          centerTitle: true,
          toolbarHeight: 65,
          backgroundColor: primarycolor,
          leading: backButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputLabel(labelText: "Camera Name"),
              const SizedBox(height: 8),
              customTextFormField(
                context,
                hintText: "e.g. Cam1",
                action: TextInputAction.next,
                controller: addCamCon.nameTC,
              ),
              const SizedBox(height: 20),
              inputLabel(labelText: "RTSP Link"),
              const SizedBox(height: 8),
              customTextFormField(
                context,
                hintText: "e.g. rtsp://admin:********",
                action: TextInputAction.next,
                controller: addCamCon.linkTC,
              ),
              const SizedBox(height: 20),
              inputLabel(labelText: "Address"),
              const SizedBox(height: 8),
              customTextFormField(
                context,
                hintText: "e.g Main Street",
                action: TextInputAction.done,
                controller: addCamCon.addressTC,
              ),
              const Expanded(child: SizedBox()),
              addCameraButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: whitecolor,
        size: 30,
      ),
    );
  }

  Widget appbarTitleWidget() {
    return Text(
      'Add Camera',
      style: textstyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        color: whitecolor,
      ),
    );
  }

  Widget customTextFormField(BuildContext context, {String? hintText, TextEditingController? controller, TextInputAction? action}) {
    return Container(
      decoration: BoxDecoration(
        color: primarycolor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        textInputAction: action,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          fillColor: whitecolor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          hintText: hintText,
          hintStyle: textstyle.copyWith(fontSize: 16, color: textcolor.withOpacity(.5)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
        cursorColor: textcolor,
        style: textstyle.copyWith(fontSize: 16, color: primarycolor),
      ),
    );
  }

  Widget inputLabel({String? labelText}) {
    return Text(
      labelText!,
      style: textstyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: .5,
        color: textcolor,
      ),
    );
  }

  Widget addCameraButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        var cName = addCamCon.nameTC.text.trim();
        var cLink = addCamCon.linkTC.text.trim();
        var locationV = addCamCon.addressTC.text.trim();
        if (cName.isEmpty && cLink.isEmpty && locationV.isEmpty) {
          customSnackbar(message: "Please Fill All The Details.", isSuccess: false);
        } else if (cName.isEmpty) {
          customSnackbar(message: "Please Enter Camera Name.", isSuccess: false);
        } else if (cLink.isEmpty) {
          customSnackbar(message: "Please Enter Camera RSTP Link.", isSuccess: false);
        } else if (locationV.isEmpty) {
          customSnackbar(message: "Please Enter The Address", isSuccess: false);
        } else {
          // con.assignCameraMethod(context);
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(primarycolor),
        fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
      ),
      child: Text(
        "Add Camera",
        style: textstyle.copyWith(
          color: whitecolor,
          fontSize: 18,
          letterSpacing: .5,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
