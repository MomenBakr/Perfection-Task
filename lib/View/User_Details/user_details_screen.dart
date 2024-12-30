import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfection_company_task/Components/my_spinner.dart';
import 'package:perfection_company_task/Components/secondary_appBar.dart';
import 'package:perfection_company_task/Controller/user_details/user_details_controller.dart';



class UserDetailsScreen extends StatelessWidget {
   UserDetailsScreen({super.key});

   var controller = Get.find<UserDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: SecondaryAppbar(),

      body: Obx((){
        if(controller.isLoading.value)
          {
            return Center(child: MySpinner());
          }else{
          return Padding(
            padding:  EdgeInsets.symmetric(vertical : 30.sp , horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          // image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCy16nhIbV3pI1qLYHMJKwbH2458oiC9EmA&s'))
                          image: NetworkImage('${controller.userDetailsModel!.data!.avatar}'))
                    ),
                  ),
                ),

                SizedBox(height: 50.h,),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${controller.userDetailsModel!.data!.firstName}',
                        style: Get.theme.textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ${controller.userDetailsModel!.data!.lastName}',
                        style: Get.theme.textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                Text(
                  '${controller.userDetailsModel!.data!.email}',
                  style: Get.theme.textTheme.displayMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600
                  ),
                )

              ],
            ),
          );
        }
      })

    );
  }
}
