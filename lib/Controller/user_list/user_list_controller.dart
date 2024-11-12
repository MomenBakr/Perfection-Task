import 'package:get/get.dart';
import 'package:perfection_company_task/Constants/consts.dart';
import 'package:perfection_company_task/Model/user_list/users_list_model.dart';
import 'package:perfection_company_task/Service/http_service/http_service.dart';

class UserListController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    getUsersList();
    super.onInit();
  }

  UsersListModel ? usersListModel ;
  RxBool isLoading = false.obs ;
  RxInt pageId = 1.obs;

  Future<void> getUsersList() async{

    isLoading.value = true ;

    String endpoint = '${baseUrl}users?page=${pageId}';

    var result = await HttpService.getRequest(endpoint);

    if(result.success)
      {
        usersListModel = UsersListModel.fromJson(result.data);
        isLoading.value = false;
        print(usersListModel!.page);
      }else{
      isLoading.value = false;
      print(result.error);
    }

  }


  void changePage(int page) {
    pageId.value = page;
    getUsersList();
  }


}