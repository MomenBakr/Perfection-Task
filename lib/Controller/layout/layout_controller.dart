import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfection_company_task/Service/Storage_service/storage_service.dart';



class LayoutController extends GetxController{



  RxBool isSideBarMenuOpened = false.obs ;
  RxBool isLanguageSwitchOpened = false.obs ;



  void toggeleSideBarMenu (){

    isSideBarMenuOpened.value = !isSideBarMenuOpened.value ;

  }


  bool isArabic (){
    return Intl.getCurrentLocale() == 'ar' ;
  }


  void toggeleLanguageSwitch() {


    isLanguageSwitchOpened.value = !isLanguageSwitchOpened.value ;

    if(StorageService.getUserData(languageKey) == false )
      {
        StorageService.saveUserData(data: true, key: languageKey);
      }else{
      StorageService.saveUserData(data: false, key: languageKey);
    }

    final newLanguage = isArabic() ? 'en' : 'ar';

    Get.updateLocale(Locale(newLanguage));

    update();

  }

  void updateUI (){
    update();
  }


}