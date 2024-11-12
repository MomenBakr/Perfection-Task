import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/user_list/user_list_controller.dart';


class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserListController());
  }
}
