import 'package:flutter/material.dart';
class confirmationpaypal extends StatefulWidget {
  const confirmationpaypal({Key? key}) : super(key: key);

  @override
  State<confirmationpaypal> createState() => _confirmationpaypalState();
}

class _confirmationpaypalState extends State<confirmationpaypal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text("confirmation"),
      backgroundColor: Colors.black,

    ),

      body:
      Column(
        children: [ Padding(padding: EdgeInsets.all(20)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'enter the amount ',
            ), style: TextStyle(
            color: Colors.black,
          ),

          ),

          SizedBox(height: 12,),
          ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {

            } ,
            label: Text("confirmer"
            ),
            icon: Icon(Icons.navigate_next),
          ) ],
      ),


    );
  }
}