

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controlers/profilecontroller.dart';
import '../model/usersmodel.dart';
import 'line_titles.dart';

class Historique_Page extends StatefulWidget {
  const Historique_Page({Key? key}) : super(key: key);

  @override
  State<Historique_Page> createState() => _Historique_PageState();
}

class _Historique_PageState extends State<Historique_Page> {
  bool _isLoaded = false;
  int _currentIndex = 0;
  double c=0 ;
  double f=0;

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
    final controller = Get.put(profilecontroller());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blueGrey,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.blueGrey,),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.blueGrey,),
            onPressed: () {},
          ),
        ),
        body: FutureBuilder(
            future: controller.getuserdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                usermodel userdata = snapshot.data as usermodel;
                var b= double.parse(userdata.accountbalance) - double.parse(userdata.oldbalance);
                c = double.parse(userdata.accountbalance);
                f = double.parse(userdata.oldbalance);
                if (snapshot.hasData) {

                  return NestedScrollView(
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
                                    children: [

                                      FadeInUp(
                                          duration: Duration(milliseconds: 800),
                                          child: Text("Balance", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 20),)),
                                      SizedBox(height: 20,),
                                      FadeInUp(
                                        duration: Duration(milliseconds: 800),
                                        child: Text( userdata.accountbalance, style: GoogleFonts.sora(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                                FadeInUp(
                                  duration: Duration(milliseconds: 1000),
                                  child: Container(
                                    width: double.infinity,
                                    height: 250,
                                    child: LineChart(
                                      mainData(),
                                      swapAnimationDuration: Duration(milliseconds: 1000), // Optional
                                      swapAnimationCurve: Curves.linear, // Optional
                                    ),
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
                          FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 20,),
                                MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xff02d39a).withOpacity(0.4), width: 1),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  splashColor: Color(0xff02d39a).withOpacity(0.4),
                                  highlightColor: Color(0xff02d39a).withOpacity(0.4),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Row(
                                    children: [
                                      Icon(Iconsax.arrow_3, color: Colors.white,),
                                      SizedBox(width: 10,),
                                      Text("Transfer", style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          // recent transactions
                          FadeInUp(
                              duration: Duration(milliseconds: 1000),
                              child: Text("Recent Transactions", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 16),)),
                          SizedBox(height: 20,),
                          Expanded(
                            child: Container(
                              height: 200,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
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
                                          Text(b.toString(), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                                          SizedBox(width: 10,),
                                          Text("12:00 PM", style: TextStyle(color: Colors.blueGrey, fontSize: 12),),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        )
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: true,
          horizontalInterval: 5000,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              dashArray: const [3, 3],
              color: const Color(0xff37434d).withOpacity(0.5),
              strokeWidth: 2,
            );
          },
          drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 5000,
          getTextStyles: (context, value) =>
          const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 11
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'MRC';
              case 20000:
                return 'aprl';
              case 40000:
                return 'may';
              case 50000:
                return 'june';
              case 60000:
                return 'current';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 5000,
          getTextStyles: (context, value) =>
          const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5000:
                return '5k';
              case 15000:
                return '15k';
              case 25000:
                return '25k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 60000,
      minY: 0,
      maxY: 25000,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded ? [
            FlSpot(0, 0),
            FlSpot(2.4,0 ),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(47500, 0),
            FlSpot(55000, f),
            FlSpot(60000, c),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0),
            FlSpot(12, 0)
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
