import 'package:flutter/material.dart';
import 'package:pfef/pages/mainpage.dart';
import 'package:pfef/pages/transactionpage.dart';
import '../componants/sidemenutitle.dart';
import 'Historique_Page.dart';
import 'Home_Page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'ProfilePage.dart';
class  hold extends StatefulWidget {
  const hold({Key? key}) : super(key: key);

  @override
  State<hold> createState() => _holdState();
}

class _holdState extends State<hold> {
  int _currentIndex=0;
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex=index;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: [
            Home_Page(),
            transaction_page(),
            Historique_Page(),
            ProfilePage(),

          ][_currentIndex],

          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(

                icon: Icon(Icons.currency_exchange),
                title: Text("transaction"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.history),
                title: Text("history"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),

        );

  }
}
