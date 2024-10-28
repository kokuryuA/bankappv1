import 'package:get/get.dart';
import 'package:pfef/auth/authentificantion.dart';
import 'package:pfef/pages/hold.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await authentification.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const hold()) : Get.back();
  }


}