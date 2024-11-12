import 'package:get/get.dart';
import 'package:perfection_company_task/Controller/user_details/user_details_controller.dart';



class UserDetailsBinding extends Bindings {

  final String id;

  UserDetailsBinding({required this.id});
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController(userId: id));
  }
}
