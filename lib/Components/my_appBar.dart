import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:perfection_company_task/Controller/layout/layout_controller.dart';

import '../generated/l10n.dart';




class MyAppbar extends StatelessWidget implements PreferredSizeWidget {

  var controller = Get.find<LayoutController>();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: 180.h,
        color: Get.theme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(
                  left: controller.isArabic() ? 0  : 12.sp ,
                  right: controller.isArabic() ? 12.sp : 0
                ),
                child: InkWell(
                  onTap: (){
                    controller.toggeleSideBarMenu();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 25.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Centered title
            Text(
              S.of(context).app_bar_title,
              style: Get.theme.textTheme.displaySmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(180.h);
}
