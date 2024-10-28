import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show AssetImage;
import 'package:get/get.dart';
import 'package:pfef/pages/Historique_Page.dart';
import 'package:pfef/pages/billspage.dart';
import 'package:pfef/pages/button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfef/pages/paymentparapplication.dart';
import 'package:pfef/pages/savings.dart';
import 'package:pfef/pages/transactionpage.dart';
import 'package:pfef/pages/transactionpage.dart';

import '../controlers/profilecontroller.dart';
import '../model/usersmodel.dart';
import 'ProfilePage.dart';
import 'package:pfef/auth/authentificantion.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profilecontroller());
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: controller.getuserdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              usermodel userdata = snapshot.data as usermodel;
              return Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "My ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                fontFamily: 'poppins',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "cards",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'balance',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 25,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                'assets/images/s_1.png',
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          userdata.accountbalance as String,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              userdata.id.toString(),
                            ),
                            Text(
                              '10/24',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(70, 70),
                          child: ClipOval(
                            child: Material(
                              color: Colors.greenAccent,
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          paiement_par_Application(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.shopping_cart),
                                    Text("quick Buy"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70),
                          child: ClipOval(
                            child: Material(
                              color: Colors.greenAccent,
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          transaction_page(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.send),
                                    Text("send"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70),
                          child: ClipOval(
                            child: Material(
                              color: Colors.greenAccent,
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => billspage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.newspaper),
                                    Text("bills"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(height: 25),
                  ProfileWidget(
                    title: "Savings",
                    icon: Icons.paid_outlined,
                    onPress: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => savings(),
                        ),
                      );
                    },
                  ),
                  ProfileWidget(
                    title: "Investments",
                    icon: Icons.stacked_bar_chart_rounded,
                    onPress: () {},
                  ),
                  SizedBox(height: 10),
                  ProfileWidget(
                    title: "Quick Logout",
                    icon: Icons.logout_outlined,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      authentification.instance.logout();
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(child: Text("Something went wrong"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
