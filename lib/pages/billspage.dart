import 'package:flutter/material.dart' ;
import 'package:fl_chart/fl_chart.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';


import 'ProfilePage.dart';
import 'line_titles.dart';

class billspage extends StatefulWidget {
  const billspage({Key? key}) : super(key: key);

  @override
  State<billspage> createState() => _Historique_PageState();
}

class _Historique_PageState extends State<billspage> {
  bool _isLoaded = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,


        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [ SizedBox(height:50),
                            Center(

                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(EdgeInsets.only(left: 30,right: 50, top: 20, bottom: 20)),
                                  backgroundColor: MaterialStatePropertyAll(Colors.black),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.blueGrey)
                                      )
                                  ),


                                ),
                                onPressed: () {

                                } ,
                                label: Text("New bill",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                icon: Icon(Icons.navigate_next),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ];
          },
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  // recent transactions
                  FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child:
                      Text("all Transactions", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 35, fontWeight: FontWeight.bold),)),

                  Expanded(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            from: 50,
                            duration: Duration(milliseconds: 1000 + index * 100),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.black.withOpacity(0.3),
                                  border: Border.all(color: Colors.blueGrey.withOpacity(0.3), width: 1)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Iconsax.arrow_3, color: Colors.blueGrey,),
                                    SizedBox(width: 10,),
                                    Text("Transfer", style: TextStyle(color: Colors.blueGrey),),
                                    SizedBox(width: 10,),
                                    Text("\$ 12,500.00", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text("12:00 PM", style: TextStyle(color: Colors.blueGrey, fontSize: 12),),
                                    Icon(Iconsax.arrow_3, color: Colors.blueGrey,),




                                  ]
                              ),



                            ),
                          );
                        },

                      ),

                    ),



                  ),  SizedBox(height: 12,),




                ]
            ),

          ),

        )
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];


}