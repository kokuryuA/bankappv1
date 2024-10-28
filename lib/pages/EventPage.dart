import'package:flutter/material.dart';



class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("welcome to the event page")
      ),
      body: Center(
          child: const Text("vous avez besoin de quoi ?")
      ),
    );


  }
}