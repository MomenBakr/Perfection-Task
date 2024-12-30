import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class MySubmitButton extends StatelessWidget {
  final String label ;
  final String ?iconPath ;
  final VoidCallback ?onTap ;
  MySubmitButton({
    required this.label,
    this.iconPath,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 56.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Get.theme.primaryColor
            // color: primaryColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath != null  ?SvgPicture.asset(
                iconPath!
            ) : SizedBox(),
            SizedBox(width: 8.w,),
            Text(
              label,
              style: Get.theme.textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),

          ],
        ),
      ),
    );
  }
}
