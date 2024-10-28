import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfef/auth/userrepo.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:pfef/pages/passwordforgot.dart';
import 'package:pfef/auth/authentificantion.dart';
class signupcontrler1 extends GetxController{
  static signupcontrler1 get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final age = TextEditingController();
  final userrepos =Get.put(userrepo());
  void registration(String email,String password)
  {
    authentification.instance.createUserWithEmailAndPassword(email, password);

  }
  Future<void> createuser(usermodel user) async {
    await userrepos.createuser(user);

  }
  void phoneauth(String phoneno) {
    authentification.instance.phoneauth(phoneno);
  }
}