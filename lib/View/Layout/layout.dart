import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/layout/layout_controller.dart';
import 'package:perfection_company_task/Service/Storage_service/storage_service.dart';
import '../../Components/side_bar_menu.dart';
import '../Users_list/users_list_screen.dart';

class Layout extends StatefulWidget {
  Layout({super.key});

  @override
  _HomeScreenWithSideBarState createState() => _HomeScreenWithSideBarState();
}

class _HomeScreenWithSideBarState extends State<Layout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _offsetAnimation;

  final controller = Get.find<LayoutController>();

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInCirc,
        ));



    // Initialize _offsetAnimation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: StorageService.getUserData(languageKey) ? const Offset(-170, 20) : const Offset(170, 20),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

// Listen for changes in the StorageService value
    controller.isLanguageSwitchOpened.listen((isRightToLeft) {
      // Update the end value of the Tween based on the new language direction
      setState(() {
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0),
          end: isRightToLeft ? const Offset(-170, 20) : const Offset(170, 20),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
      });
    });





    // Trigger animations when the sidebar state changes
    controller.isSideBarMenuOpened.listen((isOpened) {
      if (isOpened) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,

      body: Stack(
        children: [
          // SideBarMenu alignment based on language direction
          Align(
            alignment: StorageService.getUserData(languageKey)
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: SideBarMenu(),
          ),
          // Animated main content using AnimatedBuilder
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                alignment: StorageService.getUserData(languageKey)
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Transform.translate(
                  offset: _offsetAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(4, 4),
                            blurRadius: 100,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          controller.isSideBarMenuOpened.value ? 24.r : 0.r,
                        ),
                        child: UsersListScreen(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ) ,


    );
  }
}
