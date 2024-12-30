import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/login/login_controller.dart';
import '../../Components/auth_text_field.dart';
import '../../Components/my_submit_button.dart';




class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  width: Get.width,
                  height: Get.height / 2.5.h,
                ),

                SizedBox(
                  width: Get.width,
                  height: Get.height / 1.5.h,
                  // color: Colors.red,
                  child:  Padding(
                    padding:  EdgeInsets.only(right: 16.sp , left: 16.sp , top: 32.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Obx((){
                          return  AuthTextField(
                            label: 'Email',
                            // label: 'البريد الإلكتروني',
                            imagePath: 'Assets/images/sms.svg',
                            hintText: 'yourname@yourcompany.com',
                            isSuffixImage: false,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            isValidated: controller.isEmailValid.value,
                          );
                        }),

                        SizedBox(height: 16.h,),

                        Obx((){
                          return AuthTextField(
                            // label: 'كلمة المرور ',
                            label: 'Password',
                            imagePath: 'Assets/images/key.svg',
                            hintText: 'Enter your correct password',
                            // hintText: 'أدخل كلمة المرور',
                            isSuffixImage: true,
                            suffixImagePath: 'Assets/images/eye.svg',
                            controller: controller.passwordController,
                            keyboardType: TextInputType.text,
                            isHasPassword: controller.isPasswordVisible.value,
                            isValidated: controller.ispasswordValid.value,
                            onSuffixTap: (){
                              controller.togglePasswordVisibility();
                            },
                          );
                        }),

                        SizedBox(height: 32.h,),

                        Align(
                          alignment: FractionalOffset.centerLeft,
                          child: InkWell(
                            onTap: (){
                              // Get.to(NewForgetPasswordScreen());
                            },
                            child: SizedBox(
                              width: 150.w,
                              height: 50.h,
                              child: Text(
                                'Forget password ?',
                                // 'هل نسيت كلمة المرور؟',
                                style:  Get.theme.textTheme.displayLarge!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    // color: primaryColor
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 32.h,),

                        SizedBox(
                          width: Get.width,
                          height: 40.h,
                          child: Row(
                            children: [
                              Text(
                                'Don\'t have an account',
                                style: Get.theme.textTheme.displayLarge!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    // color: primaryColor
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  // Get.to(NewRegisterScreen());
                                },
                                child: SizedBox(
                                  width: Get.width / 2.5,
                                  height: 40.h,
                                  child: Center(
                                    child: Text(
                                      'Create an Account',
                                      style: Get.theme.textTheme.displayLarge!.copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          // color: primaryColor
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 24.h,),

                        Obx((){
                          if(controller.isLoading.value)
                            {
                              return Center(child: CircularProgressIndicator(color: Get.theme.primaryColor,));
                            }else{
                            return MySubmitButton(
                              label: 'Login',
                              // label: 'تسجيل الدخول',
                              iconPath: 'Assets/images/login.svg',
                              onTap: (){
                                controller.validateForm();
                              },
                            );
                          }
                        })


                      ],
                    ),
                  ),
                )

              ],
            ),
          ),

          Container(
            width: Get.width,
            height: Get.height / 2.5.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r)
                ),
                color: const Color.fromRGBO(239, 240, 241, 1)
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h,),
                  Text(
                    'Login',
                    style: Get.theme.textTheme.displayLarge!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        // color: primaryColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Welcome to our portal',
                    style: Get.theme.textTheme.displayLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(58, 83, 99, 1)
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    'Please enter your correct email and password',
                    // 'من فضلك أدخل البريد الإلكتروني وكلمة المرور',
                    style: Get.theme.textTheme.displayLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(58, 83, 99, 1)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
