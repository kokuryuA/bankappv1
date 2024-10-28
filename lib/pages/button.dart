import'package:flutter/material.dart' ;
class button extends StatelessWidget {
  final String iconImagepath ;
  final String buttonText ;


  const button({Key? key ,
  required this.iconImagepath,

  required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      height:80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,

            )
          ]
      ),
      child: Center(
        child: Image.asset(iconImagepath),
      ),
    ),
    SizedBox(
    height: 10,
    ),
    Text(buttonText,
    style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    )
    ]
    );

  }
}


