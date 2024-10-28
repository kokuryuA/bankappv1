import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfef/auth/userrepo.dart';
import 'package:pfef/controlers/profilecontroller.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:pfef/componants/textfield.dart';

import 'hold.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isObscurePassword = true;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profilecontroller());
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
        future: controller.getuserdata(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasData) {
    usermodel userdata = snapshot.data as usermodel;
    final fullname = TextEditingController(text: userdata.fullname);
    final email = TextEditingController(text: userdata.email);
    final age = TextEditingController(text: userdata.age);
    final password = TextEditingController(text: userdata.password);
    final phoneNo = TextEditingController(text: userdata.phonenumber);
    return Container(
    child: GestureDetector(
    onTap: () {
    FocusScope.of(context).unfocus();
    },
    child: ListView(
    children: [
    Container(
    width: 130,
    height: 130,
    decoration: BoxDecoration(
    border: Border.all(width: 4, color: Colors.white),
    boxShadow: [
    BoxShadow(
    spreadRadius: 2,
    blurRadius: 10,
    color: Colors.greenAccent,
    )
    ],
    shape: BoxShape.circle,
    image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('assets/images/images.png'),
    ),
    ),
    child: Positioned(
    bottom: 0,
    right: 10,
    child: Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
    width: 4,
    color: Colors.white,
    ),
    ),
    child: Icon(
    Icons.edit,
    color: Colors.white,
    ),
    ),
    ),
    ),
    SizedBox(height: 30),
    TextFormField(

    controller: fullname,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(),
    hintText: "fullname",
    prefixIcon: Icon(Iconsax.profile),
    ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    textfield(

    controler: age,
    texthint: "age",
    textInputType: TextInputType.number,
    ),
    Padding(padding: EdgeInsets.all(10)),
    TextField(
    enabled: false,
    controller: email,
    obscureText: false,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(),
    hintText: "email",
    prefixIcon: Icon(Icons.mail_outline),
    ),
    keyboardType: TextInputType.emailAddress,
    ),
    Padding(padding: EdgeInsets.all(10)),
    textfield(

    controler: password,
    texthint: 'password',
    textInputType: TextInputType.visiblePassword,
    obscure: true,
    icon: Icons.lock,
    ),
    Padding(padding: EdgeInsets.all(10)),
    textfield(

    controler: phoneNo,
    texthint: 'phoneno',
    textInputType: TextInputType.visiblePassword,
    obscure: false,
    icon: Icons.phone,
    ),
    SizedBox(height: 30),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    OutlinedButton(
    onPressed: () {},

    child: Text(
    "Cancel",
    style: TextStyle(
    fontSize: 15,
    letterSpacing: 2,
    color: Colors.white,
    ),
    ),
    style: OutlinedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.grey,
    ),
    ),
    ElevatedButton(
    onPressed: () async{
    final userdatas = usermodel(
    accountbalance: userdata.accountbalance,
    oldbalance: userdata.oldbalance,
    fullname: fullname.text.trim(),
    age: age.text.trim(),
    email: email.text.trim(),
    password: password.text.trim(),
    phonenumber: phoneNo.text);
    await controller.updaterecord(userdatas);
    Get.offAll(() => hold());
    },
    child: Text(
    "Save",
    style: TextStyle(
    fontSize: 15,
    letterSpacing: 2,
    color: Colors.white,
    ),
    ),
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.grey,
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
    } else if (snapshot.hasError) {
    return Center(child: Text(snapshot.error.toString()));
    } else {
    return Center(child: Text("Something went wrong"));
    }
  }

  else {
  return Center(child: CircularProgressIndicator());
  }
},)
,
);
}
}