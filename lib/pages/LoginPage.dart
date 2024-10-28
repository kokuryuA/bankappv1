import'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart' ;
import 'EventPage.dart';






class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView (
      child:  Center(
        child: Column(
            children:[



              const Text
                ("Sign in" ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50 ,
                  fontFamily: 'poppins',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(27),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color : Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color : Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText:'Email:',

                ),

              ),
              Padding(padding: EdgeInsets.only(top:20)),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(27),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color : Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color : Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText:'passeword:',

                ),

              ),

              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),

                ),



                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder:(_,__,___) =>EventPage()
                    ),
                  );



                },
                label: Text("sign in",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'poppins',
                  ),



                ),
                icon: Icon(Icons.account_balance_outlined),),


            ]

        ),

      ),
    ) ;
  }
}
















