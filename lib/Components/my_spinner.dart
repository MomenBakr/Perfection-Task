import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class MySpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: Get.theme.primaryColor,
        size: 50.sp,
      ),
    );
  }
}