import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/user_list/user_list_controller.dart';

class UserListCard extends StatelessWidget {

  int index ;

   UserListCard({super.key , required this.index});

   var controller = Get.find<UserListController>();


   @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Shadow color
              blurRadius: 10, // Softness of shadow
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 16.h , bottom: 5.h , right: 10 , left: 10.w),
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    image:
                    DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${controller.usersListModel!.data![index].avatar}',
                        )
                    )
                ),
              ),
              SizedBox(height: 12.h,),


              SizedBox(
                width: Get.width,
                height: 25.h,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${controller.usersListModel!.data![index].firstName}',
                        style: Get.theme.textTheme.displayLarge!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ${controller.usersListModel!.data![index].lastName}',
                        style: Get.theme.textTheme.displayLarge!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              SizedBox(
                width: Get.width,
                height: 35.h,
                child: Center(
                  child: Text(
                    '${controller.usersListModel!.data![index].email}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Get.theme.textTheme.displayMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
