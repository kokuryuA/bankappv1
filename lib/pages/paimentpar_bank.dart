import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';




class paiementpar_Banque extends StatefulWidget {
  const paiementpar_Banque ({Key? key}) : super(key: key);

  @override
  State<paiementpar_Banque > createState() => _signinState();
}

class _signinState extends State<paiementpar_Banque > {
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Online payment form."),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'card number',
              ),
            ),
            SizedBox(height: 12,),


            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'postal code',
              ),
            ),
            SizedBox(height: 20,),
            Container(
                color: Colors.white, // set the background color here
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Expire Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                )
            ),

            SizedBox(height: 200,),
            ElevatedButton.icon(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {



              } ,
              label: Text("continue"
              ),
              icon: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }
}