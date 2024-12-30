import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:perfection_company_task/Binding/user_details/user_details_binding.dart';
import 'package:perfection_company_task/Components/my_appBar.dart';
import 'package:perfection_company_task/Components/my_spinner.dart';
import 'package:perfection_company_task/Components/user_list_card.dart';
import 'package:perfection_company_task/Controller/user_list/user_list_controller.dart';
import 'package:perfection_company_task/View/User_Details/user_details_screen.dart';

import '../../generated/l10n.dart';

class UsersListScreen extends StatelessWidget {
   UsersListScreen({super.key});

   var controller = Get.find<UserListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppbar(),

      body: Obx((){
        if(controller.isLoading.value)
          {
            return Center(child: MySpinner());
          }else{
          if(controller.usersListModel!.data!.isEmpty)
            {
              return Center(
                child: Text(
                    'No Data Right Now!',
                  style: Get.theme.textTheme.displayLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600
                  ),
                ),
              );
            }else{
            return Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).our_users,
                        style: Get.theme.textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined , size: 18.sp,),
                        onPressed: () {
                          if (controller.pageId.value > 1) {
                            controller.changePage(controller.pageId.value - 1);
                          }
                        },
                      ),
                      Text(
                          '${S.of(context).page} ${controller.pageId.value}',
                        style: Get.theme.textTheme.displayLarge!.copyWith(
                          fontSize: 16.sp
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios_outlined , size: 18.sp,),
                        onPressed: () {
                          if (controller.pageId.value !=  controller.usersListModel!.totalPages) {
                            controller.changePage(controller.pageId.value + 1);
                          }
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h,),

                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.usersListModel!.perPage!.toInt(),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.sp,
                        mainAxisSpacing: 15.sp,
                        childAspectRatio: 0.75.sp,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Get.to(()=> UserDetailsScreen() , binding: UserDetailsBinding(id: controller.usersListModel!.data![index].id!.toString()));
                          },
                            child: UserListCard(index: index)
                        );
                      },
                    ),
                  )


                ],
              ),
            );
          }
        }
      })
      
    );
  }
}
