import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:perfection_company_task/View/Layout/layout.dart';


class SplashScreen extends StatefulWidget {




  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        width: 200.w,
        height: 500.h,
        child: Image.asset('Assets/images/logo.webp' ,fit: BoxFit.cover,),
      ),
      nextScreen:  Layout(),
      animationDuration: const Duration(seconds: 2),
      splashTransition: SplashTransition.rotationTransition,
      duration: 3,
    );
  }
}