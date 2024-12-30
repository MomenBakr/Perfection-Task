import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/consts.dart';
import '../../Service/http_service/http_service.dart';
import '../../View/Layout/layout.dart';

class LoginController extends GetxController{


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isEmailValid = true.obs;
  var ispasswordValid = true.obs;

  RxBool isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value =! isPasswordVisible.value;
  }

  // Validation function
  void validateForm() {
    String phone = emailController.text.trim();
    String password = passwordController.text.trim();

    isEmailValid.value = phone.isNotEmpty;
    ispasswordValid.value = password.isNotEmpty;

    if (isEmailValid.value && ispasswordValid.value) {
      print('Validation successful');
      login();
    } else {
      print('Validation failed');
    }
  }

  var isLoading = false.obs ;

  Future<void> login()async{

    isLoading.value = true ;

    var endpoint = 'https://voltasport.develop-kw.net/api/users/login';

    var data = {
      'email' : emailController.text.trim(),
      'password' : passwordController.text.trim()
    };

    var result = await HttpService.postRequest( endpoint, data );

    if(result.success)
    {

      isLoading.value = false ;

      print('login success');

      print('tokennnn : ${result.data['token']}');

      // StorageService.saveUserData(userData: result.data['token'] , key: tokenKey);
      //
      // await box.remove('token');
      // await box.write('token', '${result.data['token']}');
      //
      // await box.remove('username');
      // await box.write('username', '${result.data['user']['name']}');
      //
      // await box.remove('email');
      // await box.write('email', '${result.data['user']['email']}');
      //
      // await box.remove('avatar');
      // await box.write('avatar', '${result.data['user']['avatar']}');
      //
      // await box.remove('userPhone');
      // await box.write('userPhone', '${result.data['user']['phone']}');
      //
      //
      //
      // String username = box.read('username') ?? "Guest";
      // String greeting = 'Hello ${username.split(' ')[0]}';

      await Get.offAll(Layout());




    }else{

      isLoading.value = false ;
      // SnackBarComponent.show(
      //     header: 'Error !',
      //     message: '${result.error}'
      //   // message: 'You are logged in now.',
      // );
      print(result.error);
    }

  }






}