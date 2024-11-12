import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:perfection_company_task/Constants/consts.dart';
import 'package:perfection_company_task/Model/user_details/user_details_model.dart';
import 'package:perfection_company_task/Service/http_service/http_service.dart';



class UserDetailsController extends GetxController{

  final String userId ;

  UserDetailsController({required this.userId});


  @override
  void onInit() {
    // TODO: implement onInit
    getUserDetails();
    super.onInit();
  }

  UserDetailsModel ? userDetailsModel ;
  RxBool isLoading = false.obs ;

  Future<void> getUserDetails () async{

    isLoading.value = true ;

    String endpoint = '${baseUrl}users/${userId}';

    var result = await HttpService.getRequest(endpoint);

    if(result.success)
    {
    userDetailsModel = UserDetailsModel.fromJson(result.data);
      isLoading.value = false;
      print(userDetailsModel!.data!.email);
    }else{
      isLoading.value = false;
      print(result.error);
    }

  }



}