import 'package:flutter/material.dart';
import 'package:pfef/pages/paymentparapplication.dart';
import 'package:pfef/pages/paimentpar_bank.dart';
import 'package:iconsax/iconsax.dart';
import 'Paiementpar_PayPal.dart';
import 'Paiementpar_PayPal.dart';
import 'ProfilePage.dart';
import 'package:google_fonts/google_fonts.dart';
class transaction_page extends StatefulWidget {
  const transaction_page({Key? key}) : super(key: key);

  @override
  State<transaction_page> createState() => _transaction_pageState();
}

class _transaction_pageState extends State<transaction_page> {
  @override

  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black,
      body: ListView(
        children: [    SizedBox(height: 30,),
          Text("Chose your method of payement :",
            style : GoogleFonts.lato(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.grey,
            ),),
          SizedBox(height: 40,),
          ProfileWidget(title: 'payement with App', icon: Iconsax.volume_slash, onPress: () {Navigator.push(
              context,
              PageRouteBuilder(pageBuilder:(_,__,___) =>paiement_par_Application()
          ),
            );},),
          ProfileWidget(title: "payement with banque", icon: Icons.money, onPress: () {Navigator.push(
              context,
              PageRouteBuilder(pageBuilder:(_,__,___) =>paiementpar_Banque()
          ),); },),

          SizedBox(height: 10,),
          ProfileWidget(title: "payement with paypal", icon: Iconsax.card, onPress: () {Navigator.push(
              context,
              PageRouteBuilder(pageBuilder:(_,__,___) =>Paiementpar_PayPal()
          ),); },)
          ,
        ],
      ),

    );
  }
}
