import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/layout/layout_controller.dart';
import 'package:perfection_company_task/Service/Storage_service/storage_service.dart';
import '../generated/l10n.dart';





class SideBarMenu extends StatefulWidget {
  SideBarMenu({super.key});


  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {


  var controller = Get.find<LayoutController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSideBarMenuOpened.value
        ? InkWell(
      onTap: () {
        controller.isSideBarMenuOpened.value = false;
      },
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.8.h,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),

                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h, right: 10.w , left: 10.sp),
                        child: Row(
                          children: [
                            SizedBox(height: 150.h,),
                          Text(
                          S.of(context).change_lang,
                          style: Get.theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                            SizedBox(width: 2.w,),

                            GetBuilder<LayoutController>(
                              builder: (controller) {
                                return CupertinoSwitch(
                                  value: StorageService.getUserData(languageKey), // Assuming `isArabic()` returns a boolean value
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    controller.toggeleLanguageSwitch();
                                    print(StorageService.getUserData(languageKey));
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        : Container() // Sidebar closed
    );
  }

  // Widget buildMenuItem(String title, String assetPath, VoidCallback onTap) {
  //   return ListTile(
  //     leading: SvgPicture.asset(assetPath),
  //     title: Text(
  //       title,
  //       style: Get.theme.textTheme.displaySmall!.copyWith(
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w600,
  //       ),
  //     ),
  //     onTap: onTap,
  //   );
  // }
}
