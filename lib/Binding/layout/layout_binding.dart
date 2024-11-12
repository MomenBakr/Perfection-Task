import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/layout/layout_controller.dart';
import 'package:perfection_company_task/Controller/user_list/user_list_controller.dart';


class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController());
  }
}
