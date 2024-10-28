import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controlers/Otpcontroller.dart';
import '../controlers/controlerssignup1.dart';
class OTPScreen extends StatelessWidget {

  OTPScreen({Key? key}) : super(key: key);

  @override
  var otp;
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CO\nDE" ,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 80.0,color: Colors.white),

            ),
            Text("verification".toUpperCase(),
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
              selectionColor: Colors.white,
            ),
            const SizedBox(height: 40.0),
            const Text("enter the code sent to support@gmail.com", textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white
            ),
            ),
            const SizedBox(height: 20.0),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTP(otp);

                }

            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                OTPController.instance.verifyOTP(otp);
              }, child: const Text("tNext")),
            ),
          ],
        ),
      ),
    );
  }
}