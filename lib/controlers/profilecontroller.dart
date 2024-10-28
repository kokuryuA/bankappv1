import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:pfef/auth/userrepo.dart';
import 'package:pfef/auth/authentificantion.dart';

class profilecontroller extends GetxController {
  final authrepo = Get.put(authentification());
  final userreposi = Get.put(userrepo());


  static profilecontroller get instance => Get.find();

  Future<usermodel> getuserdata() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      return userreposi.getuserdetail(email);
    } else {
      throw Exception("Unknown error");
    }
  }

  Future<usermodel> getuserdetail(String email) async {
    return userreposi.getuserdetail(email);
  }

  Future<void> updateUserBalance(String userId, double newBalance) async {
    await userreposi.updateBalance(userId, newBalance);
    Get.snackbar(
      "Success",
      "Balance updated successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.green,
    );
  }

  Future<void> updateUserOldBalance(String userId, String oldBalance) async {
    await userreposi.updateOldBalance(userId, oldBalance);
    Get.snackbar(
      "Success",
      "Old balance updated successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.green,
    );
  }
  updaterecord(usermodel user) async{
    await userreposi.updateuserrecord(user);
  }
}
