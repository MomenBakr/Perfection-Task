import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';




class SecondaryAppbar extends StatelessWidget implements PreferredSizeWidget {



  SecondaryAppbar({super.key });


  // var controller = Get.put(ReportItemController());


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title:  Text(
            S.of(context).user_information,
            style: Get.theme.textTheme.displaySmall!.copyWith(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800
            ),
          ),
          actions: [

            SizedBox(width: 12.w,),


          ],
          iconTheme: IconThemeData(
            color: Colors.white, // Set your desired color for the back button
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);
}
