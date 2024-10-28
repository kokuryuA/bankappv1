import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class savings extends StatefulWidget {
  const savings({Key? key}) : super(key: key);

  @override
  State<savings> createState() => _savingsState();
}

class _savingsState extends State<savings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:  Container(
            padding: const EdgeInsets.all(5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 10),
                      borderRadius: BorderRadius.circular(20), //<-- SEE HERE
                    ),
                    child: Image.asset('assets/images/s_1.png',
                      height: 40,),
                  ),


                  // recent transactions

                  SizedBox(height: 250,),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            from: 50,
                            duration: Duration(milliseconds: 1000 + index * 100),

                            child: Container(

                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                              margin: const EdgeInsets.only(bottom: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.black.withOpacity(0.3),
                                  border: Border.all(color: Colors.blueGrey.withOpacity(0.3), width: 1)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                    Text("your saving is : ", style: TextStyle(color: Colors.blueGrey,
                                        fontSize: 20),),
                                    SizedBox(width: 10,),
                                    Text("\$ 1200", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20),),





                                  ]
                              ),



                            ),
                          );
                        },

                      ),

                    ),
                  )
                ]
            )
        )
    );

  }
}