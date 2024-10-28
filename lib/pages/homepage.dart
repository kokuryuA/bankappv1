import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfef/pages/hold.dart';
import 'package:pfef/pages/mainpage.dart';
import 'package:pfef/pages/passwordforgot.dart';
import 'package:pfef/pages/signin2.dart';
import '../componants/textfield.dart';
import '../controlers/login.dart';
import 'package:get/get.dart';
import 'otp_screen.dart';
import 'signin1.dart';
import 'package:pfef/controlers/login.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/image/image.svg",
                color: Colors.white,
                height: 100,
                width: 100,
              ),
              SizedBox(height: 50),
              textfield(
                controler: emailController,
                texthint: 'mail address',
                textInputType: TextInputType.emailAddress,
                icon: Icons.mail_outline,
              ),
              Padding(padding: EdgeInsets.all(10)),
              textfield(
                controler: passwordController,
                texthint: 'password',
                textInputType: TextInputType.visiblePassword,
                obscure: true,
                icon: Icons.lock,
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => OTPScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "password forgot?",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    LoginController.instance.loginUser(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
                label: Text("login"),
                icon: Icon(Icons.cabin),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.white,
                        height: 36,
                        thickness: 2.0,
                      ),
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.white,
                        height: 36,
                        thickness: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => signin1(),
                    ),
                  );
                },
                label: Text("signup"),
                icon: Icon(Icons.person_add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
