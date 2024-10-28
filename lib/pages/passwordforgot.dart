import 'package:flutter/material.dart';
class passwordforgot extends StatelessWidget {
  const passwordforgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("change the password"),
        backgroundColor: Colors.black,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "quotes of the day",
              style: TextStyle(
                fontSize: 42,
              ),
            ),
            Text("or"),
            const  Text(
              "Friedrich Nietzsche said:",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Poppins',
              ),
            ),
            const  Text(
              "'I know of no better life purpose than to perish in attempting the great and the impossible'",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ),
    );
  }
}