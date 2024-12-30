import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AuthTextField extends StatelessWidget {
  final String label ;
  final String imagePath ;
  final String hintText ;
  final bool isSuffixImage ;
  final String ?suffixImagePath ;
  final VoidCallback ?onSuffixTap ;
  final TextEditingController ?controller ;
  final TextInputType? keyboardType ;
  final bool ?isHasPassword ;
  final bool ?isValidated ;
  final bool ?isReadOnly ;
  final ValueChanged<String>? onChanged;


  const AuthTextField({
    required this.label,
    required this.imagePath,
    required this.hintText,
    this.suffixImagePath,
    required this.isSuffixImage,
    this.onSuffixTap,
    this.controller,
    this.keyboardType,
    this.isHasPassword = false,
    this.isValidated = true,
    this.isReadOnly = false,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style:  Get.theme.textTheme.displayLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(132, 147, 157, 1)
                ),
              ),
              isValidated! ? const SizedBox() : Text(
                '*required',
                style: Get.theme.textTheme.displayLarge!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 0, 0, 1)
                ),
              )
            ],
          ),
          SizedBox(height: 8.h,),
          SizedBox(
            width: Get.width,
            height: 40.h,
            child: TextField(
              onChanged: onChanged,
              style: Get.theme.textTheme.displayLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                // color: const Color.fromRGBO(132, 147, 157, 1)
              ),
              readOnly: isReadOnly!,
              obscureText: isHasPassword!,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: const Color.fromRGBO(132, 147, 157, 1),
                      width: 1.w, // Border width
                    ),
                  ),
                  prefixIcon:Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: SvgPicture.asset(
                        imagePath
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: Get.theme.textTheme.displayLarge!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(132, 147, 157, 1)
                  ),
                  suffixIcon: Padding(
                    padding:  EdgeInsets.all(8.sp),
                    child: InkWell(
                      onTap: onSuffixTap,
                      child: SvgPicture.asset(
                          isSuffixImage ? suffixImagePath! : ''
                      ),
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
