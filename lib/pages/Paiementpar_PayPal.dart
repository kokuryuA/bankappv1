import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:pfef/pages/verification.dart';
import 'package:google_fonts/google_fonts.dart';




class Paiementpar_PayPal extends StatefulWidget {
  const Paiementpar_PayPal  ({Key? key}) : super(key: key);

  @override
  State<Paiementpar_PayPal  > createState() => _signinState();
}

class _signinState extends State<Paiementpar_PayPal  > {
  String dropdownvalue = 'Item 1';
  bool? isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Online payment form. "),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ Text("Paypal",
                  style: GoogleFonts.lato(fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 50,
                    fontWeight: FontWeight.bold, ), ),
                  SizedBox(height: 50,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Email  ',
                    ),
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'password  ',
                    ),
                  ),
                  SizedBox(height: 12,),
                  Theme(
                    child: CheckboxListTile(
                      title: Text("stay connected",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {isChecked=newBool;

                        });
                      },
                    ),
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                      unselectedWidgetColor: Colors.red, // Your color
                    ),
                  ),

                  ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:(_,__,___) =>verification()
                      ), );

                    },
                    label: Text("verify"
                    ),
                    icon: Icon(Icons.navigate_next),
                  )
                ]
            )
        ) ) ;
  } }