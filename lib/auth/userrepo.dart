import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:flutter/material.dart';

class userrepo extends GetxController {
  static userrepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createuser(usermodel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .then((_) => Get.snackbar(
      "Success",
      "Your account is completed",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.green,
    ))
        .catchError((error) {
      Get.snackbar(
        "Error",
        "Something happened",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withOpacity(0.1),
        colorText: Colors.red,
      );
    });
  }

  Future<usermodel> getuserdetail(String email) async {
    final snapshot =
    await _db.collection("Users").where("email", isEqualTo: email).get();
    final userdata =
        snapshot.docs.map((e) => usermodel.fromSnapshot(e)).single;
    return userdata;
  }

  Future<List<usermodel>> alluser() async {
    final snapshot = await _db.collection("Users").get();
    final userdata =
    snapshot.docs.map((e) => usermodel.fromSnapshot(e)).toList();
    return userdata;
  }

  Future<void> updateBalance(String userId, double newBalance) async {
    await _db.collection("Users").doc(userId).update({
      "accountbalance": newBalance.toString(),
    }).then((_) {
      print("Balance updated successfully");
    }).catchError((error) {
      print("Failed to update balance: $error");
    });
  }

  Future<void> updateOldBalance(String userId, String oldBalance) async {
    await _db.collection("Users").doc(userId).update({
      "oldbalance": oldBalance,
    }).then((_) {
      print("Old balance updated successfully");
    }).catchError((error) {
      print("Failed to update old balance: $error");
    });
  }

  Future<void> updateuserrecord(usermodel user) async {
    try {
      final snapshot = await _db
          .collection("Users")
          .where("email", isEqualTo: user.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        await _db.collection("Users").doc(docId).update(user.toJson());
        print("User record updated successfully");
      } else {
        throw Exception("User document not found");
      }
    } catch (error) {
      print("Failed to update user record: $error");
      // Handle the error or display an error message to the user
    }
  }
}
