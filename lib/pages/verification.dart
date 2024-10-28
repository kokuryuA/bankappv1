import 'package:flutter/material.dart';
import 'package:pfef/pages/confirmationpaypal.dart';
class verification extends StatelessWidget {
  const verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("verification"),
        backgroundColor: Colors.black,

      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Text("verification text"),
              Padding(padding: EdgeInsets.only(left: 0.0,top: 0,bottom: 20,right: 0)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter the code sent',
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () { Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder:(_,__,___) =>confirmationpaypal()
                  ),);



                } ,
                label: Text("Confirm",
                  style: TextStyle(color: Colors.white,
                  ),
                ),
                icon: Icon(Icons.navigate_next),
              )
            ],


          )
      ),

    );
  }
}