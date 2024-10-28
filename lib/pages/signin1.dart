import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:pfef/pages/signin2.dart';
import 'package:get/get.dart';

import '../componants/textfield.dart';
import '../controlers/controlerssignup1.dart';

class signin1 extends StatelessWidget {
  const signin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signupcontrler1());
    final _formkey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'signin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            const Text(
              'create a new accounts',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  textfield(
                    controler: controller.name,
                    texthint: 'name',
                    textInputType: TextInputType.name,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  textfield(
                    controler: controller.age,
                    texthint: "age",
                    textInputType: TextInputType.number,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  textfield(
                    controler: controller.email,
                    texthint: 'mail adress',
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.mail_outline,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  textfield(
                    controler: controller.password,
                    texthint: 'password',
                    textInputType: TextInputType.visiblePassword,
                    obscure: true,
                    icon: Icons.lock,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    color: Colors.white,
                    child: IntlPhoneField(
                      controller: phoneController,
                      decoration:const InputDecoration(
                        labelText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'US',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),

                  ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        final user = usermodel(
                            fullname: controller.name.text.trim(),
                            age: controller.age.text.trim(),
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            phonenumber: phoneController.text.trim(),
                          accountbalance: "0",
                          oldbalance: "0"
                        );
                        signupcontrler1.instance.createuser(user);
                        signupcontrler1.instance.registration(controller.email.text.trim(), controller.password.text.trim());



                      }
                    },
                    label: Text('continue'),
                    icon: Icon(Icons.navigate_next),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

