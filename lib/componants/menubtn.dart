import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class menubtn extends StatelessWidget {
  const menubtn({
    super.key,
    required this.press,
    required this.riveOnInit,
  });
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
        margin: EdgeInsets.only(left: 16),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0,3),
              blurRadius: 8,
            ),
          ],
        ),
        child: RiveAnimation.asset(
          "assets/RiveAssets/menu_button.riv",
          onInit: riveOnInit,
        ),
      ),
      ),

    );
  }
}
