import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:pfef/pages/verification.dart';
import 'package:pfef/controlers/controlerssignup1.dart';
import 'otp_screen.dart';
import 'package:pfef/auth/authentificantion.dart';


class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  String dropdownvalue = 'Item 1';
  TextEditingController country = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController codepostal = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(signupcontrler1());
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    Get.put(signupcontrler1());
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("continu"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              TextFormField(
                controller: country,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'country/city',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a country/city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: adress,
                decoration:const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: codepostal,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'code postal',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a postal code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              SizedBox(height: 200),
              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                label: Text("continue"),
                icon: Icon(Icons.navigate_next),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  authentification.instance.logout();
                },
                icon: Icon(Icons.logout, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
