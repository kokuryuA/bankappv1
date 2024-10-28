import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pfef/auth/authentificantion.dart';


class LoginController extends GetxController {
  static LoginController get instance => Get.find();



  final email = TextEditingController();
  final password = TextEditingController();




  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await authentification.instance.loginWithEmailAndPassword(email, password);
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }


  }
}