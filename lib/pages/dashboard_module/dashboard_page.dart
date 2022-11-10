import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartview_admin/controller/dashboard_controller.dart';
import 'package:smartview_admin/themes/colors.dart';

import '../../constants/strings.dart';
import '../../themes/textstyles.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final dashCon = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: dashCon.scaffoldKey,
      backgroundColor: whitecolor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: primarycolor,
        centerTitle: true,
        title: appbarTitleWidget(),
      ),
      floatingActionButton: addButton(),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 16 / 11,
              ),
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Cam${index + 1}',
                    style: textstyle.copyWith(
                      fontSize: 16,
                      color: whitecolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget appbarTitleWidget() {
    return Column(
      children: [
        Text(
          smartViewT,
          style: textstyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: whitecolor,
          ),
        ),
        Text(
          adminT,
          style: textstyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: whitecolor,
          ),
        ),
      ],
    );
  }

  Widget addButton() {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: primarycolor,
      onPressed: () {
        Get.toNamed('/add-camera');
      },
      child: const Icon(
        Icons.add_rounded,
        size: 35,
        color: whitecolor,
      ),
    );
  }
}
